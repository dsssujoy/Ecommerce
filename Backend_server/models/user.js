const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (value) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Simple email regex
        return emailRegex.test(value);
      },
      message: "Invalid email format", // Custom error message
    },
  },
  password: {
    type: String,
    required: true,
    // validate: {
    //   validator: (value) => {
    //     const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;
    //     return passwordRegex.test(value);
    //   },
    //   message:
    //     "Password must be at least 8 characters long, include at least one uppercase letter, one number, and one special character",
    // },
  },

  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  //CART
  cart: [
    {
      product: { type: mongoose.Schema.Types.ObjectId, ref: "Product" }, // Referencing the Product model
      quantity: { type: Number, default: 1 }, // Default quantity set to 1
    },
  ],
});

const User = mongoose.model("User", userSchema);

module.exports = User;
