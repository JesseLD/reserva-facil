import Queue from "./Queue";

export class QueueManager {
  private static instance: QueueManager;
  private queues: { [key: string]: Queue } = {};

  private constructor() {}

  public static getInstance(): QueueManager {
    if (!QueueManager.instance) {
      QueueManager.instance = new QueueManager();
    }
    return QueueManager.instance;
  }

  // Registrar uma nova fila
  public registerQueue(queueName: string): Queue {
    if (!this.queues[queueName]) {
      this.queues[queueName] = new Queue(queueName);
    }
    return this.queues[queueName];
  }

  // Obter uma fila registrada
  public getQueue(queueName: string): Queue {
    return this.queues[queueName];
  }
}
