export interface IQueryClient {
  select: (query: string, params?: any[]) => Promise<any[] | []>;
  insert: (query: string, params?: any[]) => Promise<any | undefined>;
  update: (query: string, params?: any[]) => Promise<any | undefined>;
  delete: (query: string, params?: any[]) => Promise<any | undefined>;
}
