const JWT = require("jsonwebtoken");
const User = require("../models/user.js");

const admin = async (req, res, next) => {
  try {
    const token = req.header("X-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    // Verify the token
    const verified = JWT.verify(token, "passwordKey"); // Use a properly defined secret key
    if (!verified)
      return res.status(401).json({ msg: "Token verification failed" });
    const user = await User.findById(verified.id);
    if (user.type == "user" || user.type == "seller") {
      return res.status(401).json({ msg: "you are not an Admin" });
    }

    // Attach user information to the request
    req.user = verified.id; // Fix typo: `res.user` should be `req.user`
    req.token = token;

    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = admin;
