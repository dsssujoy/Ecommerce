const express = require("express");
const auth = require("../middleware/auth_middleware.js");
const { Product } = require("../models/product.js");
const User = require("../models/user.js");
const userRoute = express.Router();

userRoute.post("/api/add-to-cart", auth, async (req, res) => {
  try {
    // Get product ID from request body
    const { id } = req.body;

    // Check if the product ID is valid
    if (!id) {
      return res.status(400).json({ error: "Product ID is required" });
    }

    // Find product by ID
    const product = await Product.findById(id);
    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }

    // Find the logged-in user
    let user = await User.findById(req.user);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    // Check if the user has a cart and if the product is already there
    let isProductFound = false;
    for (let i = 0; i < user.cart.length; i++) {
      // Compare the product ID with the cart product IDs
      if (user.cart[i].product._id.equals(product._id)) {
        isProductFound = true;
        // If product is found, update the quantity
        user.cart[i].quantity += 1;
        break;
      }
    }

    // If product is not found in the cart, add it
    if (!isProductFound) {
      user.cart.push({
        product,
        quantity: 1,
      });
    }

    // Save updated user document
    user = await user.save();

    // Send the updated user as response
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = userRoute;
