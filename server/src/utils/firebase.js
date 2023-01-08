import { getGoogleAuthToken } from './jwtHelper';

// import { initializeApp } from 'firebase-admin/app';
const serviceAccount = require('../../service-account.json');
export async function send({
  fcmToken,
  data,
  notification,
}) {
  const accessToken = await getGoogleAuthToken(
    serviceAccount.client_email,
    serviceAccount.private_key,
    'https://www.googleapis.com/auth/firebase.messaging'
  );
  const URL = `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`
  const headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + accessToken
  };
  const message = {
    notification,
    data,
    token: fcmToken,
  };
  const body = JSON.stringify({ message })
  const resp = await fetch(URL, {
    method: 'POST',
    headers,
    body
  })
  const resposne = await resp.json()
  return {
    status: 'success',
    resposne,
  }
  // const resp = await admin.messaging().send(message);
  // console.log('resp=>resp', resp);
}