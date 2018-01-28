function [] = sign_fn(x,L,B)
    count = 1;
    if x >= 0 %????????????????????????????????Integer
        I = floor(x);
    else
        I = ceil(x);
    end

    tmp = abs(x);
    while tmp >= 1 %???Integer??????????????Fraction
        tmp = tmp - 1;
    end
    F = tmp;

    %%% Integer and sign
    if I >= 0
        Sign = '0';
    else 
        Sign = '1';
    end
    Ls = dec2bin(abs(I));
    while numel(Ls) < L 
        Ls = strcat('0', Ls); %chain string horizontally
    end

    out = strcat(Sign,Ls,'.');

    %%% Fraction
    if F == 0 %??????????fraction????0?????????????0 ??????????0 ??????????????????????
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

    fprintf('x = %d <==> %s\n', x, out);
    %%% bin2dec
    %%% integer part
    out2 = 0;
    count = L-1;
    for i=2:1:1+L 
        tmp = str2double(out(i));
        out2 = out2+(tmp)*(2^(count));
    %     disp(out2);
        count = count - 1;
    end
    % disp(out2);

    %%% fraction part
    count = 1;

    for i=3+L:1:2+L+B
        tmp = str2double(out(i));    
    %     disp(out2);
    %     disp(tmp);
    %     disp((tmp)*(2^(-count)));
        out2 = out2+(tmp)*(2^(-count));
        count = count + 1;
    end

    if out(1) == '1'
        out2 = out2*-1;
    end

    fprintf('x = %s <==> %d\n',  out,out2);
end

