import { FastifyInstance } from "fastify";
import z from "zod";
import { prisma } from "../../lib/prisma";


export async function getPoll(app:FastifyInstance){
    app.get("/poll/:pollId", async(request, reply) =>{
        const getPollParams = z.object({
            pollId: z.string().uuid(),
        })
        const {pollId} = getPollParams.parse(request.params)

        const poll = await prisma.poll.findUnique({
            where:{
                id:pollId
            },

            include:{
                Options:{
                    select:{
                        id:true,
                        title:true
                    }
                }
            }
        })

        return reply.status(200).send(poll)
    })

}