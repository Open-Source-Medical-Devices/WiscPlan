% Surendra Prajapati 2014
% This code extracts the primary fraction from the EGS output file --> "... .lst" 
% remember the "linenum" may change, so double check that
% note: mu-en/rho = mu/rho x primary fraction 
%

close all;
clear all;

cd('E:\UW MADISON\Wisc Fall 2014\Kernels-revised_9-24-2014\EDKnrcOutputFiles-After09242014')

energyarr = [5:5:250];

for count = 1:length(energyarr)
        fname = strcat(num2str(energyarr(count)),'keV_XCOM_HighRes.egslst');
        fid = fopen(fname);
        linenum = 230;
        data = textscan(fid, '%s', 1, 'delimiter', '\n', 'headerlines', linenum-1);
     
        data2 = data{1};
        data3 = cell2mat(data2);
        data3 = data3(26:33);
        PriFrac(count) = str2num(data3);
       
        fclose(fid);  
end

PriFrac = PriFrac';