function [plain_return] = func_dec_multiplication(cipher_str,n_multi)
    % A : 65 -- 90
    % a : 97 -- 122
    inv_multi = [27,53,79,105,131,157];
    [a,b] = size(inv_multi);
    for i = a:b
        r = rem(inv_multi(i),n_multi);
        if r == 0
            n_multi = (inv_multi(i)/n_multi);
            break
        end
    end
    if r == 0
        to_ascii = double(cipher_str);
        [x,y] = size(to_ascii);
        plain_return = '';
        for indx = x:y
            to_multi = mod((n_multi*(to_ascii(indx)-65)),26)+97;
            to_chars = char(to_multi);
            if cipher_str(indx) ~= ' '
                plain_return = strcat(plain_return,to_chars);
            else
                plain_return = strcat(plain_return,{' '});            
            end
        end
        plain_return = char(plain_return);
    else
        fprintf('%d bukan bilangan prima',n_multi);
        plain_return = NaN;
    end
end