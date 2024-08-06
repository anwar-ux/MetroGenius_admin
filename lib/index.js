const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const cors = require('cors')({origin: true});

// Configure the email transport using the default SMTP transport and a GMail account.
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'shihabca818@gmail.com',
    pass: 'uddkqbgoeyzmozbq'
  }
});

exports.sendWelcomeEmail = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    const { Email, EmployeeCode } = req.body;

    const mailOptions = {
      from: 'Your Company <your-email@gmail.com>',
      to: email,
      subject: 'Welcome to the Company',
      text: `Your employee code is ${EmployeeCode}`,
      html: `<p>Your employee code is <b>${EmployeeCode}</b></p>`
    };

    return transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).send(error.toString());
      }
      return res.status(200).send('Email sent: ' + info.response);
    });
  });
});
