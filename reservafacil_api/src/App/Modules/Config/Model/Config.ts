import { AppDataSource } from "../../../Database/database";

export class Config {
  async getConfig(track: string, target: string | undefined) {

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
        AppVersion.track = ? AND AppVersion.target = ?
      ORDER BY
        AppVersion.createdAt DESC
      LIMIT 
      1
    `, [track, target || 'all']);
    return version[0];
  }
}
