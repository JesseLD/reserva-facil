import { AppDataSource } from "../../../Database/database";

export class Config {
  async getConfig(track: string) {

    // const payload = {

    //   version: null
    // };
   const version = await AppDataSource.query(
    `SELECT
        AppVersion.version,
        AppVersion.buildNumber,
        AppVersion.track,
        AppVersion.createdAt
      FROM
        AppVersion
      WHERE	
        AppVersion.track = ?
      LIMIT 
      1
    `, [track]);
    return version[0];
  }
}
