import nodemailer from "nodemailer";
import config from "../../../Config/config";
import {
  generateActivateAccountHTML,
  generateRecoverPassHTML,
} from "./mailHtml";

const transporter =
  config.mail.service == ""
    ? nodemailer.createTransport({
        host: config.mail.host,
        port: Number.parseInt(config.mail.port.toString()),
        // secure: config.mail.secure,
        // auth: {
        //   user: config.mail.user,
        //   pass: config.mail.pass,
        // },
      } as nodemailer.SendMailOptions)
    : nodemailer.createTransport({
        service: config.mail.service,
        auth: {
          user: config.mail.user,
          pass: config.mail.pass,
        },
      });

const mailOptions = {
  from: config.mail.mailFrom,
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
      from: config.mail.mailFrom,
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

  async sendActivateAccountMail(
    target: string,
    code: string,
    name: string,
    subject: string
  ) {
    const mailOptions = {
      from: config.mail.mailFrom,
      to: target,
      subject: subject,
      // text: "Este é um teste de envio de e-mail usando MailHog.",
      html: generateActivateAccountHTML(name, code),
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
}

export const mailService = new MailService();
