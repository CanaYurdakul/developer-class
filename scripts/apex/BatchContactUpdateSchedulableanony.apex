string sbc = '0 0 9 * * ?';

BatchContactUpdate bc = new BatchContactUpdate();
system.schedule('BatchContactUpdate', sbc, bc); 

