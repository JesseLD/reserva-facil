import nodemailer from "nodemailer";
import config from "../../../Config/config";
import {
  acceptHtml,
  denyHtml,
  generateActivateAccountHTML,
  generateRecoverPassHTML,
  pendingHtml,
} from "./mailHtml";

let transporter = nodemailer.createTransport({
  host: config.mail.host,
  port: Number.parseInt(config.mail.port.toString()),
  // secure: config.mail.secure,
  // auth: {
  //   user: config.mail.user,
  //   pass: config.mail.pass,
  // },
} as nodemailer.SendMailOptions);

if (config.mail.useGmail) {
  transporter = nodemailer.createTransport({
    service: config.mail.service,

    auth: {
      user: config.mail.user,
      pass: config.mail.pass,
    },
  });
}

const mailOptions = {
  from: config.mail.mailFromName,
  to: "jesseluis120@gmail.com",
  subject: "Teste de Email Local",
  // text: "Este é um teste de envio de e-mail usando MailHog.",
  // html: ,
};

class MailService {
  async sendMail() {
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
    // Send mail logic
  }
  async sendPasswordVerifyMail(
    target: string,
    code: string,
    name: string,
    subject: string
  ) {
    const mailOptions = {
      from: `"${config.mail.mailFromName}" <${config.mail.user}>`,
      to: target,
      subject: subject,
      // text: "Este é um teste de envio de e-mail usando MailHog.",
      html: generateRecoverPassHTML(name, code),
    };

    console.log(config.mail.useGmail);

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
    // Send mail logic
  }

  async sendActivateAccountMail(
    target: string,
    code: string,
    name: string,
    subject: string
  ) {
    const mailOptions = {
      from: config.mail.mailFromName,
      to: target,
      subject: subject,
      // text: "Este é um teste de envio de e-mail usando MailHog.",
      html: generateActivateAccountHTML(name, code),
    };

    // console.log("USER" + config.mail.user);
    // console.log("PASS" + config.mail.pass);

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
    // Send mail logic
  }

  async sendPasswordResetCode(
    target: string,
    code: string,
    name: string,
    subject: string
  ) {
    const mailOptions = {
      from: config.mail.mailFromName,
      to: target,
      subject: subject,
      // text: "Este é um teste de envio de e-mail usando MailHog.",
      html: generateRecoverPassHTML(name, code),
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
    // Send mail logic
  }

  async sendRecoverPassword(
    target: string,
    code: string,
    name: string,
    subject: string
  ) {
    const mailOptions = {
      from: config.mail.mailFromName,
      to: target,
      subject: subject,
      // text: "Este é um teste de envio de e-mail usando MailHog.",
      html: generateActivateAccountHTML(name, code),
    };

    // console.log("USER" + config.mail.user);
    // console.log("PASS" + config.mail.pass);

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
    // Send mail logic
  }
  
  async sendReservationEmail(
    target: string,
    subject: string,
    name: string,
    date: string,
    time: string,
    people: string,
    restaurant: string,
    observations: string,
    type: string,
  ) {


    let generatedHTML = "";

    if(type == "pending") {
      generatedHTML = pendingHtml(name, date, time, people, restaurant, observations);
    } else if(type == "confirm") {
      generatedHTML = acceptHtml(name, date, time, people, restaurant, observations);
    } else {
      generatedHTML = denyHtml(name, date, time, people, restaurant, observations);
    }


    const mailOptions = {
      from: config.mail.mailFromName,
      to: target,
      subject: subject,
      // text: "Este é um teste de envio de e-mail usando MailHog.",
      html: generatedHTML,
    };

    // console.log("USER" + config.mail.user);
    // console.log("PASS" + config.mail.pass);

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
    // Send mail logic
  }
}

export const mailService = new MailService();
