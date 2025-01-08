import { IQueryClient } from "./interfaces/IQueryClient";
import { AppDataSource } from "./database";

export class QueryClient implements IQueryClient {
  async select(query: string): Promise<any[]> {
    try {
      await AppDataSource.initialize();

      const result = await AppDataSource.query(query);

      return result;
    } catch (error) {
      // console.error("SELECT Query Error:", error);
      // return [];
      throw new Error("SELECT Query Error: " + error);
    } finally {
      await AppDataSource.destroy();
    }
  }
  async insert(query: string): Promise<any> {
    try {
      await AppDataSource.initialize();

      const result = await AppDataSource.query(query);

      return result;
    } catch (error) {
      throw new Error("INSERT Query Error: " + error);
    } finally {
      await AppDataSource.destroy();
    }
  }
  async update(query: string): Promise<any> {
    try {
      await AppDataSource.initialize();

      const result = await AppDataSource.query(query);

      return result;
    } catch (error) {
      throw new Error("UPDATE Query Error: " + error);
    } finally {
      await AppDataSource.destroy();
    }
  }
  async delete(query: string): Promise<any> {
    try {
      await AppDataSource.initialize();

      const result = await AppDataSource.query(query);

      return result;
    } catch (error) {
      throw new Error("DELETE Query Error: " + error);
    } finally {
      await AppDataSource.destroy();
    }
  }
}
