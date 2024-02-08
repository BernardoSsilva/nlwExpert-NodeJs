-- CreateTable
CREATE TABLE "options" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "poolId" TEXT NOT NULL,

    CONSTRAINT "options_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "options" ADD CONSTRAINT "options_poolId_fkey" FOREIGN KEY ("poolId") REFERENCES "polls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
