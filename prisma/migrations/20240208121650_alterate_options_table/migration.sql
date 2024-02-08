/*
  Warnings:

  - You are about to drop the column `poolId` on the `options` table. All the data in the column will be lost.
  - Added the required column `pollId` to the `options` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "options" DROP CONSTRAINT "options_poolId_fkey";

-- AlterTable
ALTER TABLE "options" DROP COLUMN "poolId",
ADD COLUMN     "pollId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "options" ADD CONSTRAINT "options_pollId_fkey" FOREIGN KEY ("pollId") REFERENCES "polls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
