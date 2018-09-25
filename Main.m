[filepath,name,ext] = fileparts('english.txt');

if(ext == '.txt')
    fid = fopen(filepath,'r');
    final = fscanf(fid);
   % visualiza(final)
    drawhist();
elseif(ext == '.wav')
    aid= audioread(filepath);
    ainf= audioinfo(filepath);
    drawhist();
  
end