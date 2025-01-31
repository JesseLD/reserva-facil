import Bull from "bull"
import { RedisOptions } from "ioredis"
import config from "../../../Config/config";

const redisConfig: RedisOptions = {
  host: config.redis.host,
  port: Number.parseInt(config.redis.port as string),  // Porta padrão do Redis
};

export const reservationQueue = new Bull("reservation", { redis: redisConfig });

async function addReservation(reservation: any) {
  await reservationQueue.add(reservation);

}

reservationQueue.process(async (job) => { 
  const reservation = job.data;
  console.log("Processing Reservation: ", job.data);


  const success = await processReservation(reservation);

  if (success) {
    // return true;
    console.log("Reservation processed successfully");
  } else {
    // return false;
    console.log("Error processing reservation");
  }

})


async function processReservation(reservation: any) {
  // await addReservation(reservation);
  return true
}