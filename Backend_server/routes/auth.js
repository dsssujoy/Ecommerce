const express = require("express");
const User = require("../models/user.js");
const bcrypt = require("bcrypt");
const JWT = require("jsonwebtoken");
const auth=require('../middleware/auth_middleware.js')

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const exsistingUser = await User.findOne({ email });
    if (exsistingUser) {
      return res.status(400).json({ msg: "user already exsist" });
    }
    const hashedpassword = await bcrypt.hash(password, 8);
    let user = new User({
      email,
      password: hashedpassword,
      name,
    });

    user = await user.save();
    res.status(200).json({ msg: "user Register complate" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const exsistingUser = await User.findOne({ email });
    if (!exsistingUser) {
      return res.status(400).json({ msg: "user does not exsist" });
    }
    const isMatch = await bcrypt.compare(password, exsistingUser.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }
    const token = JWT.sign({ id: exsistingUser._id }, "passwordKey");
    res.json({ token, ...exsistingUser._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
authRouter.post("/api/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("X-auth-token");
    if (!token) return res.json(false);
    const verivyed=JWT.verify(token, "passwordKey");
    if(!verivyed) return res.json(false)
    const user=await User.findById(verivyed.id)
    if(!user) return res.json(false)
    res.json(true);

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get user data
authRouter.get("/userData",auth, async (req, res) => {
  try {
    const user=await User.findById(req.user);
    res.json({...user._doc,token:req.token})

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
