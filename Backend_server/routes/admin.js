const express = require("express");
const adminRoute = express.Router();
// const admin = require("../middleware/admin_middleware.js");
const Product = require("../models/product.js");

adminRoute.post("/admin/add-product", async (req, res) => {
  try {
    const { name, description, price, quantity, image, catagory,maxPrice,offer,size } = req.body;
    let product = new Product({
      name,
      description,
      price,
      quantity,
      image,
      catagory,
      maxPrice,
      offer,
      size
    });
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
//get all product
adminRoute.get("/admin/get-all-product", async (req, res) => {
  try {
    const product = await Product.find({});
    res.status(200).json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//delete product
adminRoute.post("/admin/delete-product", async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRoute;
