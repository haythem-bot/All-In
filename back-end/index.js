var express = require("express");
const cors = require("cors");
const app = express();
const bodyParser = require("body-parser");
const port = 3000;
const db = require('../back-end/database-mysql/index')
const adminsRoutes = require('./routes/admins')
  



app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(express.json());
app.use(cors({ origin: "*" }));


app.use('/api/admins',adminsRoutes)
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
