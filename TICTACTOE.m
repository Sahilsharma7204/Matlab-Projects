

function varargout = TICTACTOE(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TICTACTOE_OpeningFcn, ...
                   'gui_OutputFcn',  @TICTACTOE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
global arr;
global t;

function [ a ] = tictacutil( arr )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
flag=1;
for i=1:1:3
    for j=1:1:3
        if arr(i,j)==0
            flag=0;
        end
    end
end

a=flag;
% --- Executes just before TICTACTOE is made visible.
function TICTACTOE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TICTACTOE (see VARARGIN)

% Choose default command line output for TICTACTOE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TICTACTOE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TICTACTOE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function move_Callback(hObject, eventdata, handles)
% hObject    handle to move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of move as text
%        str2double(get(hObject,'String')) returns contents of move as a double


% --- Executes during object creation, after setting all properties.
function move_CreateFcn(hObject, eventdata, handles)
% hObject    handle to move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function player1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Player2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Player2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in p11.
function p11_Callback(hObject, eventdata, handles)
% hObject    handle to p11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global arr;
global t;
s=get(handles.move,'string');

 
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end

p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p11,'string','X');
    g=1;
else 
    set(handles.p11,'string','O');
    g=2;
end
set(handles.p11,'enable','off');
arr(1,1)=g;
flag=0;
if arr(2,1)==g & arr(3,1)==g
    flag=1;
       set(handles.p31,'BackgroundColor','green'); 
    set(handles.p21,'BackgroundColor','green'); 
     set(handles.p31,'BackgroundColor','green'); 
end
if arr(2,2)==g & arr(3,3)==g
    flag=1;
     set(handles.p11,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p33,'BackgroundColor','green'); 
    
end
    if arr(1,2)==g & arr(1,3)==g
        flag=1;
          set(handles.p11,'BackgroundColor','green'); 
    set(handles.p12,'BackgroundColor','green'); 
     set(handles.p13,'BackgroundColor','green'); 
    end
        if flag==1
            if g==1
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
        end
    if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
        
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   
function p12_Callback(hObject, eventdata, handles)
% hObject    handle to p12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p12,'string','X');
    g=1;
else 
    set(handles.p12,'string','O');
    g=2;
end
arr(1,2)=g;
set(handles.p12,'enable','off');
flag=0;
if arr(1,1)==g & arr(1,3)==g
    flag=1;
      set(handles.p12,'BackgroundColor','green'); 
    set(handles.p11,'BackgroundColor','green'); 
     set(handles.p13,'BackgroundColor','green'); 
end
if arr(2,2)==g & arr(3,2)==g
    flag=1;
      set(handles.p12,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p32,'BackgroundColor','green'); 
end
   
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is --  ',p25));
            
        end
    end

           if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   
% --- Executes on button press in p31.
function p31_Callback(hObject, eventdata, handles)
% hObject    handle to p31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p31,'string','X');
    g=1;
else 
    set(handles.p31,'string','O');
    g=2;
end
arr(3,1)=g;
set(handles.p31,'enable','off');
flag=0;
if arr(2,2)==g & arr(1,3)==g
    flag=1;
      set(handles.p31,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p13,'BackgroundColor','green'); 
end
if arr(3,2)==g & arr(3,3)==g
    flag=1;
      set(handles.p31,'BackgroundColor','green'); 
    set(handles.p32,'BackgroundColor','green'); 
     set(handles.p33,'BackgroundColor','green'); 
end
    if arr(1,1)==g & arr(2,1)==g
        flag=1;
          set(handles.p31,'BackgroundColor','green'); 
    set(handles.p11,'BackgroundColor','green'); 
     set(handles.p21,'BackgroundColor','green'); 
    end
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
        end
           if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   
% --- Executes on button press in p22.
function p22_Callback(hObject, eventdata, handles)
% hObject    handle to p22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p22,'string','X');
    g=1;
else 
    set(handles.p22,'string','O');
    g=2;
end
arr(2,2)=g;
set(handles.p22,'enable','off');
flag=0;
if arr(1,2)==g & arr(3,2)==g
    flag=1;
      set(handles.p32,'BackgroundColor','green'); 
    set(handles.p12,'BackgroundColor','green'); 
     set(handles.p22,'BackgroundColor','green'); 
end
if arr(2,1)==g & arr(2,3)==g
    flag=1;
      set(handles.p21,'BackgroundColor','green'); 
    set(handles.p23,'BackgroundColor','green'); 
     set(handles.p22,'BackgroundColor','green'); 
end
    if arr(1,1)==g & arr(3,3)==g
        flag=1;
          set(handles.p11,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p33,'BackgroundColor','green'); 
    end
        if arr(1,3) & arr(3,1)
            flag=1;
              set(handles.p31,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p13,'BackgroundColor','green'); 
        end
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
        
end
           if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   
% --- Executes on button press in p23.
function p23_Callback(hObject, eventdata, handles)
% hObject    handle to p23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p23,'string','X');
    g=1;
else 
    set(handles.p23,'string','O');
    g=2;
end
arr(2,3)=g;
set(handles.p23,'enable','off');
flag=0;
if arr(1,3)==g & arr(3,3)==g
    flag=1;
      set(handles.p13,'BackgroundColor','green'); 
    set(handles.p33,'BackgroundColor','green'); 
     set(handles.p23,'BackgroundColor','green'); 
end
if arr(2,2)==g & arr(2,1)==g
    flag=1;
      set(handles.p22,'BackgroundColor','green'); 
    set(handles.p21,'BackgroundColor','green'); 
     set(handles.p23,'BackgroundColor','green'); 
end
  
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
     
    
end
           if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   
% --- Executes on button press in p32.
function p32_Callback(hObject, eventdata, handles)
% hObject    handle to p32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p32,'string','X');
    g=1;
else 
    set(handles.p32,'string','O');
    g=2;
end
arr(3,2)=g;
set(handles.p32,'enable','off');
flag=0;
if arr(3,1)==g & arr(3,3)==g
    flag=1;
      set(handles.p32,'BackgroundColor','green'); 
    set(handles.p31,'BackgroundColor','green'); 
     set(handles.p33,'BackgroundColor','green'); 
end
if arr(2,2)==g & arr(1,2)==g
    flag=1;
      set(handles.p12,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p32,'BackgroundColor','green'); 
end

        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
        
    end

              if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end     
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   

% --- Executes on button press in p13.
function p13_Callback(hObject, eventdata, handles)
% hObject    handle to p13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end

p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p13,'string','X');
    g=1;
else 
    set(handles.p13,'string','O');
    g=2;
end
arr(1,3)=g;
set(handles.p13,'enable','off');
flag=0;
if( arr(2,3)==g & arr(3,3)==g)
    flag=1;
      set(handles.p13,'BackgroundColor','green'); 
    set(handles.p23,'BackgroundColor','green'); 
     set(handles.p33,'BackgroundColor','green'); 
end
if arr(2,2)==g & arr(3,1)==g
    flag=1;
      set(handles.p31,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p13,'BackgroundColor','green'); 
end
    if arr(1,1)==g & arr(1,2)==g
        flag=1;
          set(handles.p13,'BackgroundColor','green'); 
    set(handles.p11,'BackgroundColor','green'); 
     set(handles.p12,'BackgroundColor','green'); 
    end
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
end
           if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   
% --- Executes on button press in p21.
function p21_Callback(hObject, eventdata, handles)
% hObject    handle to p21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p21,'string','X');
    g=1;
else 
    set(handles.p21,'string','O');
    g=2;
end
arr(2,1)=g;
set(handles.p21,'enable','off');
flag=0;
if arr(2,2)==g & arr(2,3)==g
    flag=1;
      set(handles.p21,'BackgroundColor','green'); 
    set(handles.p22,'BackgroundColor','green'); 
     set(handles.p23,'BackgroundColor','green'); 
end
if arr(1,1)==g & arr(3,1)==g
    flag=1;
      set(handles.p21,'BackgroundColor','green'); 
    set(handles.p11,'BackgroundColor','green'); 
     set(handles.p31,'BackgroundColor','green'); 
end
  
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
        end

           if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   

% --- Executes on button press in p33.
function p33_Callback(hObject, eventdata, handles)
% hObject    handle to p33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arr;
global t;
s=get(handles.move,'string');
n=str2num(s);
if n==0
    arr=[0 0 0;0 0 0;0 0 0];
    t=0;
end
p15=get(handles.player1,'string');
p25=get(handles.Player2,'string');

g=0;
if mod(t,2)==0
    set(handles.p33,'string','X');
    g=1;
else 
    set(handles.p33,'string','O');
    g=2;
end
arr(3,3)=g;
set(handles.p33,'enable','off');
flag=0;
if arr(1,3)==g & arr(2,3)==g
    flag=1;
      set(handles.p33,'BackgroundColor','green'); 
    set(handles.p13,'BackgroundColor','green'); 
     set(handles.p23,'BackgroundColor','green'); 
end
if arr(2,2)==g & arr(1,1)==g
    flag=1;
      set(handles.p33,'BackgroundColor','green'); 
    set(handles.p11,'BackgroundColor','green'); 
     set(handles.p22,'BackgroundColor','green'); 
end
    if arr(3,1)==g & arr(3,2)==g
        flag=1;
          set(handles.p33,'BackgroundColor','green'); 
    set(handles.p31,'BackgroundColor','green'); 
     set(handles.p32,'BackgroundColor','green'); 
    end
        if flag==1
            if(g==1)
                set(handles.result,'string',strcat('Winner is -- ',p15));
            else
                set(handles.result,'string',strcat('Winner is -- ',p25));
            end
        
end
         if(flag==0 & tictacutil(arr)==1)
        msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end
    if(flag==1)
      pause(2);
      msgbox('GAME OVER CLICK ON  PLAYAGAIN');
    end  
                
    t=t+1;
   d=num2str(t);
   set(handles.move,'string',d);
   



function player1_Callback(hObject, eventdata, handles)
% hObject    handle to player1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of player1 as text
%        str2double(get(hObject,'String')) returns contents of player1 as a double



function Player2_Callback(hObject, eventdata, handles)
% hObject    handle to Player2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Player2 as text
%        str2double(get(hObject,'String')) returns contents of Player2 as a double



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in playagain.
function playagain_Callback(hObject, eventdata, handles)
% hObject    handle to playagain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.move,'string','0');
set(handles.p11,'string',' ');
set(handles.p12,'string',' ');
set(handles.p13,'string',' ');
set(handles.p21,'string',' ');
set(handles.p22,'string',' ');
set(handles.p23,'string',' ');
set(handles.p31,'string',' ');
set(handles.p32,'string',' ');
set(handles.p33,'string',' ');

set(handles.result,'string','  ');


set(handles.move,'BackgroundColor','yellow');
set(handles.p11,'BackgroundColor','yellow');
set(handles.p12,'BackgroundColor','yellow ');
set(handles.p13,'BackgroundColor','yellow');
set(handles.p21,'BackgroundColor',' yellow');
set(handles.p22,'BackgroundColor','yellow ');
set(handles.p23,'BackgroundColor','yellow ');
set(handles.p31,'BackgroundColor','yellow');
set(handles.p32,'BackgroundColor','yellow');
set(handles.p33,'BackgroundColor','yellow');


set(handles.p11,'enable','on');
set(handles.p12,'enable','on');
set(handles.p13,'enable','on');
set(handles.p21,'enable','on');
set(handles.p22,'enable','on');
set(handles.p23,'enable','on');
set(handles.p31,'enable','on');
set(handles.p32,'enable','on');
set(handles.p33,'enable','on');
