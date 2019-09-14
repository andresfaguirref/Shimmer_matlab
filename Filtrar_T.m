function Filatrado = Filtrar_T(data,Frec_muest,Frec_cort,Orden,show, type)

    Fs = Frec_muest;      
    Fnyq = Fs/2;    
    
    
    Fco_lp = Frec_cort;     
    [b_lp,a_lp] = butter(Orden,Fco_lp/Fnyq, type);    
    
    Filatrado = filtfilt(b_lp, a_lp,data);
    
    if show
        figure()
        
        plot(Filatrado);
        hold on
        plot(data,'r');
        hold off
     
    end
end