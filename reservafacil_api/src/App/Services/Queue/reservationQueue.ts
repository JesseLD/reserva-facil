import { QueueManager } from "./QueueManager";

const queueManager = QueueManager.getInstance();
const reservationQueue = queueManager.registerQueue("reservation");

reservationQueue.process(async (reservation) => {
  console.log("Processing reservation:", reservation);

  const success = await processReservation(reservation);
  return success;
});

async function processReservation(reservation: any) {
  // Implementar a lógica de processamento
  console.log("Processing reservation...");
  return true; // Retornar sucesso ou falha
}

// Adicionando uma reserva na fila
export async function addReservation(reservation: any) {
  await reservationQueue.add(reservation);
}
