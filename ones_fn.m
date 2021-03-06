function [] = ones_fn(x,L,B)
    count = 1;
    if x >= 0 
        I = floor(x);
    else
        I = ceil(x);
    end

    tmp = abs(x);
    while tmp >= 1
        tmp = tmp - 1;
    end
    if tmp == 0
        F = 0;
    else
        F = tmp;
    end
    
    %%% Integer
    Ls = dec2bin(abs(I));
    while numel(Ls) < L 
        Ls = strcat('0', Ls);
    end

    out = strcat(Ls,'.');

    %%% Fraction
    if F == 0
        for i=1:1:B
            out = strcat(out,'0');
        end
    else
        while count <= B
            F = 2*F;
            if F >= 1
                out = strcat(out,'1');
                F = F - 1;
            else
                out = strcat(out,'0');
            end
            count = count + 1;
        end
    end
    %%% one's complement
    if x < 0
        for i=1:1:numel(out)
            if out(i) == '1'
                out(i) = '0';
            elseif out(i) == '0'
                out(i) = '1';
            end
        end
    end
    fprintf('x = %d <==> %s\n', x, out);

    %%%%%%%%%%%%%%%%%%%%%%%%%% bin2dec %%%%%%%%%%%%%%%%%%%%%%%%%%
    negative = false;
    out_ones = out;
    if out(1) == '1'
        negative = true;
    end
    if negative
        for i=1:1:numel(out)
            if out(i) == '1'
                out(i) = '0';
            elseif out(i) == '0'
                out(i) = '1';
            else
                out(i) = out(i);
            end
        end
    end

    %%% integer part
    out2 = 0;
    count = L-1;
    for i=1:1:L 
        tmp = str2double(out(i));
        out2 = out2+(tmp)*(2^(count));
    %     disp(out2);
        count = count - 1;
    end

    %%% fraction part
    count = 1;

    for i=2+L:1:1+L+B %2+L is ?????????????+????????????????B+L
        tmp = str2double(out(i));    
        out2 = out2+(tmp)*(2^(-count));
        count = count + 1;
    end

    if negative
        out2 = out2*-1;
    end

    fprintf('x = %s <==> %d\n',  out_ones,out2);
end

