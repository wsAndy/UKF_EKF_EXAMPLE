function start_ukf(handles)


x0 = get(handles.edt_x0,'String');
y0 = get(handles.edt_y0,'String');
N = get(handles.edt_N,'String');
P = get(handles.edt_P,'String');
Q = get(handles.edt_Q,'String');
R = get(handles.edt_R,'String');
tar = get(handles.edt_tar,'String');

x0 = str2double(x0);
y0 = str2double(y0);
N = str2double(N);
R =str2double(R);

if(N > 3 & N < 300)
    Q = [getValue(Q)];
    P = [getTarValue(P)];
    tar = [getTarValue(tar)];
    if ( isempty(Q) || isempty(P) || isempty(tar)  )
        errordlg('²ÎÊý´íÎó1','´íÎó');
    else
        ukf(x0,y0,P,Q,R,N,tar);
    end
else
     errordlg('²ÎÊý´íÎó2','´íÎó');
end

end

function out = getValue(a)
pot = strfind(a,',');
pot_ = strfind(a,';');

if ( size(pot,2) == 2 & size(pot_,2) == 1)
    out = [str2double(a(1:pot(1)-1)) str2double(a(pot(1)+1:pot_(1)-1)) ; str2double(a(pot_(1)+1:pot(2)-1)) str2double(a(pot(2)+1:end))]; 
else
    out = [];
end
end

function out = getTarValue(tar)
    pot = strfind(tar,',');
    if(size(pot,2) ~= 3)
        out = [];
    else
        out = [str2double(tar(1:pot(1)-1)) str2double(tar(pot(1)+1:pot(2)-1)) str2double(tar(pot(2)+1:pot(3)-1)) str2double(tar(pot(3)+1:end)) ];
    end
end