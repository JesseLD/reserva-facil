export const readQueue = async (queue: string) => {

  setInterval(() =>{
    console.log("Reading queue: ", queue, "..." + new Date().toISOString());
  }, 10000)
}