import { https } from 'firebase-functions';
import { createTransport } from 'nodemailer';
const cors = require('cors')({ origin: true });

// Configure the email transport using the default SMTP transport and a GMail account.
const transporter = createTransport({
  service: 'gmail',
  auth: {
    user: 'shihabca818@gmail.com',
    pass: 'uddkqbgoeyzmozbq'
  }
});

export const sendWelcomeEmail = https.onRequest((req, res) => {
  cors(req, res, () => {
    const { Email, EmployeeCode } = req.body;

    const mailOptions = {
      from: 'Your Company <shihabca818@gmail.com>',
      to: Email,
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
