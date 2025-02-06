const mongoose = require("mongoose");
const ratingSchema = require("./rating.js");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  price: {
    type: Number,
    required: true,
  },

  quantity: {
    type: Number,
    default: "1",
    required: true,
  },
  image: [
    {
      type:String,
      required:true
    }
  ],
  catagory:{
    type: String,
    required: true,
    trim: true,
  },
  maxPrice:{
    type: Number,
    required: true,
  },
  offer:{
    type: Number,
    required: true,
  },
  size: [
    {
      type:String,
      required:true
    }
  ],
  rating:[ratingSchema]
  //CART
});

const Product = mongoose.model("Product", productSchema);

module.exports = {Product};
