import { PrismaClient } from "@prisma/client/extension";
import fastify from "fastify";
import { z } from "zod";

const app = fastify();
const port = 3333;

const prisma = new PrismaClient();

app.post("/polls", async (request) => {
  const createPollBody = z.object({
    title: z.string(),
  });
  const { title } = createPollBody.parse(request.body);

  const poll = await prisma.create.poll({
    data: {
      title,
    },
  });

  return reply.status(201).send({ poolId: poll.id });
});

app.listen({ port }).then(() => {
  console.log(`Listening on port ${port}`);
});
