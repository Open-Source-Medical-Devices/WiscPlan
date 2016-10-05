% Surendra Prajapati 2014
% This code extracts the mu/rho (attenuation coefficeint) from the EGS output file --> "... .lst" 
% remember the "linenum" may change, so double check that


close all;
clear all;

cd('E:\UW MADISON\Wisc Fall 2014\Kernels-revised_9-24-2014\EDKnrcOutputFiles-After09242014')

energyarr = [5:5:250];

for count = 1:length(energyarr)
        fname = strcat(num2str(energyarr(count)),'keV_XCOM_HighRes.egslst');
        fid = fopen(fname);
        linenum = 185;
        data = textscan(fid, '%s', 1, 'delimiter', '\n', 'headerlines', linenum-1);
     
        data2 = data{1};
        data3 = cell2mat(data2);
        data3 = data3(33:42);
        attcoef(count) = str2num(data3);
        
        fclose(fid);  
end

attcoef = attcoef';