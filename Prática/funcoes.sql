#valor absoluto
select 1, -12, abs(1), abs(-12), abs(0);

#rand - números entre zero e um
select rand() as zero_um;

select rand() as zero_um, 10*rand() as zero_dez;
