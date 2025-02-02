import Bull from "bull";
import { RedisOptions } from "ioredis";
import config from "../../../Config/config";

const redisConfig: RedisOptions = {
  host: config.redis.host,
  port: Number.parseInt(config.redis.port as string),  // Porta padrão do Redis
};

export class Queue {

  private queue: Bull.Queue;

  constructor(queueName: string) {
    this.queue = new Bull(queueName, { redis: redisConfig });
  }

  // Adicionar um item à fila
  public async add(jobData: any) {
    await this.queue.add(jobData);
  }

  // Processar a fila
  public process(processingFunction: (jobData: any) => Promise<boolean>) {
    this.queue.process(async (job) => {
      const jobData = job.data;
      console.log(`Processing Job in ${this.queue.name}:`, jobData);

      const success = await processingFunction(jobData);

      if (success) {
        console.log(`${this.queue.name} processed successfully`);
      } else {
        console.log(`Error processing ${this.queue.name}`);
      }
    });
  }
}
