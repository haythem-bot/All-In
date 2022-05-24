const db = require('../database-mysql')


let insertDonation = (req,res) => {
    let {donation_name,type,status,image_url} = req.body
    const sql = `INSERT INTO donations(donation_name,type,status,image_url) values (?,?,?,?)`
    db.query(sql,[donation_name,type,status,image_url],(err,donation)=>{
        if (err) res.status(500).send(err)
        else res.status(200).send(donation)
    })

}

let addDonation = (req,res) => {
    const { image } = req.body;
  await cloudinary.uploader.upload(image, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      const url = result.secure_url;
      console.log(url);
      res.send(url);
      
}

module.exports = { insertDonation}
