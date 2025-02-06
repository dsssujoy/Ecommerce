const express = require("express");
const productRoute = express.Router();
const auth = require("../middleware/auth_middleware.js");
const { Product } = require("../models/product.js");

productRoute.get("/api/products", auth, async (req, res) => {
  try {
    console.log(req.query.catagory);
    const product = await Product.find({ catagory: req.query.catagory });
    res.json({ product });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRoute.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    console.log(req.params.name);
    const product = await Product.find({
      name: {
        $regex: req.params.name,
        $options: "i",
      },
    });
    res.json({ product });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
//

productRoute.post("/api/rating", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let product = await Product.findById(id);
    //
    for (let i = 0; i < product.rating.length; i++) {
      if (product.rating[i].userId == req.user) {
        product.rating.splice(i, 1);
        break;
      }
    }
    const ratingSchema = {
      userId: req.user,
      rating: rating,
    };
    product.rating.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRoute;
