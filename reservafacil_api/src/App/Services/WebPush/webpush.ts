import webpush from 'web-push';

const vapidKeys = {
  publicKey: process.env.VAPID_PUBLIC_KEY || "",
  privateKey: process.env.VAPID_PRIVATE_KEY || "",
};

// Configuração das chaves VAPID
webpush.setVapidDetails(
  'mailto:jesseluis120@gmail.com', // Seu email
  vapidKeys.publicKey,
  vapidKeys.privateKey
);

// Função para enviar notificação push
export const sendPushNotification = (subscription: any, payload: string) => {
  webpush.sendNotification(subscription, payload)
    .then(response => console.log('Notificação enviada com sucesso', response))
    .catch(error => console.error('Erro ao enviar notificação', error));
};
