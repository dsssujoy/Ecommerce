//  import from package
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const PORT = 3000;
const DB =
  "mongodb+srv://sujoy:Sujoydas2004@cluster0.70bjc.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
//  IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth.js");
const adminRoute = require("./routes/admin.js");
const productRoute = require("./routes/product.js");
const userRoute = require("./routes/user.js");
//  INISILIZED
const app = express();
//API

//middleware
app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(adminRoute);
app.use(productRoute);
app.use(userRoute);
//connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("DataBase Connect");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log("server is running on port: ", PORT);
});
