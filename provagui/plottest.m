function varargout = plottest(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plottest_OpeningFcn, ...
                   'gui_OutputFcn',  @plottest_OutputFcn, ...
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


% --- Executes just before plottest is made visible.
function plottest_OpeningFcn(hObject, eventdata, handles, varargin)

set(handles.figure1,'Position',[135 51 200 100])
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plottest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plottest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
reset(handles.axes1);
reset(handles.axes2);

plot3(handles.axes1, 0,0, 0);
plot3(handles.axes2, 0,0, 0);
set(handles.axes2, 'Visible', 'off');

grafico_scelto = get(handles.popupmenu1, 'String');

val = get(handles.popupmenu1,'Value');


% Set current data to the selected data set.
switch grafico_scelto{val};
case 'Figura 10'
    
    x0_var = get(handles.edit1, 'string')
    x0_var = str2double(x0_var);
    y0_var = get(handles.edit2, 'string')
    y0_var = str2double(y0_var);
    z0_var = get(handles.edit3, 'string')
    z0_var = str2double(z0_var);
    w0_var = get(handles.edit4, 'string')
    w0_var = str2double(w0_var);
    init = [x0_var y0_var z0_var w0_var];
    tspan = [0 :0.005: 180];
    [t,y] = ode45(@solve10_foo,tspan, init);
    %subplot(1,2,1), plot3(y(:,2),y(:,1),y(:,3))
    plot3(handles.axes1,y(:,2),y(:,1),y(:,3))
    ax = gca;
    ax.YDir = 'reverse';
     xlabel('y'); ylabel('x'); zlabel('z');
     zlim([-4 1.5]); ylim([-4 3.5]); xlim([-2.5 2]);
     title ('Primo grafico')
     %figure
     %subplot(1,2,2), plot3(y(:,1),y(:,4),y(:,2))
    plot3(handles.axes2, y(:,1),y(:,4),y(:,2))
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('x'); ylabel('w'); zlabel('y');
    zlim([-2.5 2]); ylim([-2 2]); xlim([-4 3.5]);
    title ('Secondo Grafico')
    grid
    hold on;
    set(handles.axes2, 'Visible', 'on');
case 'Figura 12' 
    tspan = [0 :0.01: 100];
    x0_var = get(handles.edit1, 'string')
    x0_var = str2double(x0_var);
    y0_var = get(handles.edit2, 'string')
    y0_var = str2double(y0_var);
    z0_var = get(handles.edit3, 'string')
    z0_var = str2double(z0_var);
    w0_var = get(handles.edit4, 'string')
    w0_var = str2double(w0_var);
    
    init = [x0_var y0_var z0_var w0_var];
    [t,y] = ode23s(@solve12_foo,tspan, init);
   plot3(handles.axes1,y(:,2),y(:,1),y(:,3))
    ax = gca;
    %ax.XDir = 'reverse';
    ax.YDir = 'reverse';
     xlabel('y'); ylabel('x'); zlabel('z');
     zlim([-50 60]); ylim([-20 20]); xlim([-15 15]);
     title ('Primo grafico')
    plot3(handles.axes2,y(:,1),y(:,4),y(:,2))
    ax = gca;
    ax.YDir = 'reverse';
     xlabel('x'); ylabel('w'); zlabel('y');
     zlim([-15 15]); ylim([-2 2]); xlim([-20 20]);
    title ('Secondo Grafico')
    grid
    hold on;
    
    set(handles.axes2, 'Visible', 'on');
case 'Figura 17' 
   % intervallo e valori iniziali
    x0_var = get(handles.edit1, 'string')
    x0_var = str2double(x0_var);
    y0_var = get(handles.edit2, 'string')
    y0_var = str2double(y0_var);
    z0_var = get(handles.edit3, 'string')
    z0_var = str2double(z0_var);
    init = [x0_var y0_var z0_var ];

    tspan = [0 :0.01: 50];
    %solved ode
    [t,y] = ode45(@solve17_foo, tspan, init);

    %grafica
    axes(handles.axes1);
    plot3(y(:,2), y(:,1), y(:,3), 'Color', 'cyan')
    grid
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('y'); ylabel('x'); zlabel('z');
    zlim([-1.5 1.5]); ylim([-0.8 0.8]); xlim([-0.8 0.8]);
    title('Figura 17');
    hold on;
    plot3( -y(:,2), -y(:,1), -y(:,3), 'Color', 'magenta')
    hold off;
    %set(handles.axes2, 'Visible', 'off');

case 'Figura 23' 

    x0_var = get(handles.edit1, 'string')
    x0_var = str2double(x0_var);
    y0_var = get(handles.edit2, 'string')
    y0_var = str2double(y0_var);
    init = [x0_var y0_var];
    %y0=[0.4 0];
    tspan=[0 400];
    [t,y] = ode45(@solve22_foo, tspan, init);
    plot(handles.axes1,t,y(:,1))
    xlabel('t'); ylabel('x');
    ylim([0 0.45]); xlim(tspan);
    
   %set(handles.axes2, 'Visible', 'off');

case 'Figura 26'         
    x0_var = get(handles.edit1, 'string')
    x0_var = str2double(x0_var);
    y0_var = get(handles.edit2, 'string')
    y0_var = str2double(y0_var);
    z0_var = get(handles.edit3, 'string')
    z0_var = str2double(z0_var);
    w0_var = get(handles.edit4, 'string')
    w0_var = str2double(w0_var);
    
    init = [x0_var y0_var z0_var w0_var];
    
    tspan = [0 :0.01: 300];

    %ode solved
    [t,y] = ode45(@solve26_foo, tspan, init);

    %plot 1
    plot3(handles.axes1,y(:,2), y(:,1), y(:,3), 'Color', 'magenta', 'Linewidth', 0.2)
    grid
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('y'); ylabel('x'); zlabel('z');
    zlim([-6 6]); ylim([-5 5]); xlim([-1.5 1.5]);
    title('Figura 26.1');

    %plot2
    plot3(handles.axes2,y(:,1), y(:,4), y(:,2), 'Color', 'cyan', 'Linewidth', 0.2)
    grid
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('y'); ylabel('x'); zlabel('z');
    zlim([-1.5 1.5]); ylim([-3 3]); xlim([-5 5]);
    title('Figura 26.2');
    hold on;

    set(handles.axes2, 'Visible', 'on');
case 'Figura 29' 
    tspan = [0 :0.005: 100];    
    x0_var = get(handles.edit1, 'string')
    x0_var = str2double(x0_var);
    y0_var = get(handles.edit2, 'string')
    y0_var = str2double(y0_var);
    z0_var = get(handles.edit2, 'string')
    z0_var = str2double(z0_var);
    init = [x0_var y0_var z0_var];
    axes(handles.axes1);
    [t,y] = ode23(@solve29_foo,tspan, init);
    plot3(y(:,2),y(:,1),y(:,3), 'Color', 'b')
    ax = gca;
    ax.YDir = 'reverse';
     xlabel('y'); ylabel('x'); zlabel('z');
     zlim([-3 3]); ylim([-4 4]); xlim([-3 3]); 
     hold on
    plot3(-y(:,2),-y(:,1),-y(:,3), 'Color', 'r')

     hold off
     %set(handles.axes2, 'Visible', 'off');

case 'Figura 32'
    tspan = [0 : 0.0003 : 0.5];
    %%N.B. l'intervallo temporale si ferma a 1/2, altrimenti l'argomento di sqrt diventa negativo 
    %non servono valori iniziali, dipendono da tspan
    z=1-sqrt(1-2*tspan);
    %Plot
    axes(handles.axes1);
    title('FIGURA 36');
    plot(tspan,z)
     xlabel('t'); ylabel('z');
    ylim([0 1.2]); xlim([0 0.6]);
      %set(handles.axes2, 'Visible', 'off');
    

case 'Figura 33' 
case 'Figura 35'
case 'Figura 36' 
    tspan = [0 : 0.0003 : 0.3645];
    C=3.645
    %%N.B. l'intervallo temporale si ferma a C/10, altrimenti l'argomento di sqrt diventa negativo 
    x=3-sqrt(2*(C-10*tspan));
    %Plot
    axes(handles.axes1);
    title('FIGURA 36');
    plot(tspan,x)
     xlabel('t'); ylabel('x');
    ylim([0 3.5]); xlim([0 0.4]);
end





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
reset(handles.axes1);
reset(handles.axes2);
set(handles.axes2, 'Visible', 'on');
set(handles.pushbutton2, 'Visible', 'on');
set(handles.text2, 'String', 'Condizioni iniziali');
plot3(handles.axes1, 0,0, 0);
plot3(handles.axes2, 0,0, 0);
str = get(hObject, 'String');
val = get(hObject,'Value');

switch str{val};
case 'Scegli figura'
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','on')
    
    set(handles.edit1,'String',0)
    set(handles.edit2,'String',0)
    set(handles.edit3,'String',0)
    set(handles.edit4,'String',0)
case 'Figura 10'
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','on')
    
    %Fisso valori iniziali consigliati
    set(handles.edit1,'String',0.01)
    set(handles.edit2,'String',0.01)
    set(handles.edit3,'String',0.01)
    set(handles.edit4,'String',0.01)
case 'Figura 12' 
   %Faccio comparire solo le variabili che servono
   set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','on')
    
    %Fisso valori iniziali consigliati
    set(handles.edit1,'String',4)
    set(handles.edit2,'String', 5)
    set(handles.edit3,'String', 0.4)
    set(handles.edit4,'String',0.5)

    
case 'Figura 17' 
   %Faccio comparire solo le variabili che servono
   set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','on')
    
    set(handles.axes2, 'Visible', 'off');
    %Fisso valori iniziali consigliati
    
    set(handles.edit1,'String',-0.495)
    set(handles.edit2,'String',-0.3)
    set(handles.edit3,'String',-0.3)
case 'Figura 23' 
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','off')
    set(handles.edit4,'Visible','off')
    set(handles.axes2, 'Visible', 'off');

    %Fisso valori iniziali consigliati
    set(handles.edit1,'String',0.4)
    set(handles.edit2,'String',0)
case 'Figura 26' 
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','on')
    
    %Fisso valori iniziali consigliati
    set(handles.edit1,'String',0.001)
    set(handles.edit2,'String',0.002)
    set(handles.edit3,'String',0.09)
    set(handles.edit4,'String',0.09)
case 'Figura 29' 
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','off')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','on')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','off')
    
    set(handles.axes2, 'Visible', 'off');

    
    %Fisso valori iniziali consigliati   
    set(handles.edit1,'String',-1.9)
    set(handles.edit2,'String',-2)
    set(handles.edit3,'String',-2.3)
    
case 'Figura 32'
   %Faccio comparire solo le variabili che servono
   set(handles.text3,'Visible','off')
    set(handles.text4,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    
    set(handles.edit1,'Visible','off')
    set(handles.edit2,'Visible','off')
    set(handles.edit3,'Visible','off')
    set(handles.edit4,'Visible','off')
    set(handles.axes2, 'Visible', 'off');

    %No valori iniziali consigliati
    set(handles.text2, 'String', 'Questo grafico non prevede condizioni iniziali');
    set(handles.pushbutton2, 'Visible', 'off');
case 'Figura 33' 
    
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','off')
    set(handles.text4,'Visible','off')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','off')
    
    set(handles.edit1,'Visible','off')
    set(handles.edit2,'Visible','off')
    set(handles.edit3,'Visible','on')
    set(handles.edit4,'Visible','off')
    
    %Fisso valori iniziali consigliati
    set(handles.edit3,'String',0)
case 'Figura 35'
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    
    set(handles.edit1,'Visible','on')
    set(handles.edit2,'Visible','off')
    set(handles.edit3,'Visible','off')
    set(handles.edit4,'Visible','off')
    
    %Fisso valori iniziali consigliati
case 'Figura 36' 
    set(handles.text2, 'String', 'Questo grafico non prevede condizioni iniziali');
    %Faccio comparire solo le variabili che servono
    set(handles.text3,'Visible','off')
    set(handles.text4,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    
    set(handles.edit1,'Visible','off')
    set(handles.edit2,'Visible','off')
    set(handles.edit3,'Visible','off')
    set(handles.edit4,'Visible','off')
    
    
    set(handles.axes2, 'Visible', 'off');
    set(handles.pushbutton2, 'Visible', 'off');
    %no valori iniziali 
end
%%%%%%%%%%%%%%%%%%cliccare il bottono pushbutton1_Callback(hObject, eventdata, handles)
% Save the handles structure.
guidata(hObject,handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.edit1, 'string', rand)
set(handles.edit2, 'string', rand)
set(handles.edit3, 'string', rand)
set(handles.edit4, 'string', rand)


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
