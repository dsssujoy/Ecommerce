const JWT = require("jsonwebtoken");

const auth = async (req, res, next) => {
  try {
    // Check for the token in the request header
    const token = req.header("X-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    // Verify the token
    const verified = JWT.verify(token, "passwordKey"); // Use a properly defined secret key
    if (!verified)
      return res.status(401).json({ msg: "Token verification failed" });

    // Attach user information to the request
    req.user = verified.id; // Fix typo: `res.user` should be `req.user`
    req.token = token;

    next(); // Call the next middleware
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = auth;
