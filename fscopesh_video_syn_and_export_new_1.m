function varargout = fscopesh_video_syn_and_export_new_1(varargin)
% FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1 MATLAB code for fscopesh_video_syn_and_export_new_1.fig
%      FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1, by itself, creates a new FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1 or raises the existing
%      singleton*.
%
%      H = FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1 returns the handle to a new FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1 or the handle to
%      the existing singleton*.
%
%      FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1.M with the given input arguments.
%
%      FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1('Property','Value',...) creates a new FSCOPESH_VIDEO_SYN_AND_EXPORT_NEW_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fscopesh_video_syn_and_export_new_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fscopesh_video_syn_and_export_new_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fscopesh_video_syn_and_export_new_1

% Last Modified by GUIDE v2.5 07-Jul-2019 15:56:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fscopesh_video_syn_and_export_new_1_OpeningFcn, ...
                   'gui_OutputFcn',  @fscopesh_video_syn_and_export_new_1_OutputFcn, ...
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


% --- Executes just before fscopesh_video_syn_and_export_new_1 is made visible.
function fscopesh_video_syn_and_export_new_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fscopesh_video_syn_and_export_new_1 (see VARARGIN)

% Choose default command line output for fscopesh_video_syn_and_export_new_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fscopesh_video_syn_and_export_new_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fscopesh_video_syn_and_export_new_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global slider_value
global Data
set(hObject,'sliderstep',[0.02 0.1]);
slider_value = get(hObject,'value');
y_min = Data.y_min;
y_max = Data.y_max;
tot_time = Data.tot_time;
fscope_fps = Data.fscope_fps;
fscope_signal_time = Data.fscope_signal_time;
fscope_signal = Data.fscope_signal;
axes(handles.axes4);
cla;
plot(fscope_signal_time(1:fscope_fps:round(tot_time*fscope_fps)),fscope_signal(1:fscope_fps:round(tot_time*fscope_fps)));
xlim([0 tot_time]);
hold on;
plot([tot_time*slider_value tot_time*slider_value],[y_min y_max],'r');
set(handles.text22,'str',num2str(round(tot_time*slider_value)));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
directoryname = get(hObject,'string');
% str = 'D:\analysis\MPOA opto';
search_path=path;
bool=all(ismember(directoryname,search_path));
if bool == 0
    errordlg('The Directory pathway isn''t exist, please enter or choose a DirPath','Â·¾¶´íÎó');
end
set(hObject,'fontsize',10);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dname = uigetdir('C:\ycwei\postdoc\video Analysis\A_fscope');
set(handles.edit8,'string',dname,'fontsize',10);
guidata(hObject,handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DirPath = get(handles.edit8,'string');
cd(DirPath)
dname = uigetfile('*');
set(handles.edit9,'string',dname,'fontsize',10);
guidata(hObject,handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'foregroundcolor','red');
global Data
pause(0.01)
DirPath = get(handles.edit8,'string');
FileName = get(handles.edit9,'string');
if strfind(FileName,'signal')
    filename = FileName(1:end-11);
else filename = FileName(1:end-4);
end

MovPath = get(handles.edit10,'string');
MovName = [filename,'.avi'];


cd(DirPath)
% load the fscope data 
if strfind(FileName,'signal')
    tmp = load(FileName);
    fscope_fps = tmp.res.fscope_fps;
    tot_time = tmp.res.fscope_tot_time;
    fscope_signal = tmp.res.fscope_signal_filter;
    fscope_signal_time = tmp.res.fscope_signal_time;
    clear tmp;
    
else
    tmp = load(FileName);
    fscope_fps = tmp.res.fscope_fps;
    fscope_signal_time = tmp.res.fscope_time;
    fscope_signal = tmp.res.fscope_signal_amp;
%     fscope_signal = tmp.res.fscope_trigger_signal;
    fscope_signal = fscope_signal*100;
    time_accum = tmp.res.time_accum;
    tot_time = fscope_signal_time(end);
    tot_time = time_accum(end);
    if time_accum(end) > fscope_signal_time(end)
        point_add = round((time_accum(end) - fscope_signal_time(end))*fscope_fps);
        fscope_signal(end+1:end+point_add,1) = fscope_signal(end,1);
        fscope_signal_time(end+1:end+point_add,1) = fscope_signal_time(end) + 1/fscope_fps :1/fscope_fps :fscope_signal_time(end) + point_add/fscope_fps;
    end
    clear tmp;
end

Data.time_accum = time_accum;
Data.fscope_signal = fscope_signal;
Data.fscope_signal_time = fscope_signal_time;
Data.fscope_fps = fscope_fps; 
Data.tot_time = tot_time;
y_min = min(fscope_signal(3*fscope_fps:60*10*fscope_fps));
y_max = max(fscope_signal(3*fscope_fps:60*10*fscope_fps))*1.2;
Data.y_min = y_min;
Data.y_max = y_max;

cd(MovPath)
if ~exist(MovName,'file')
    msgbox(['There is no movie file named ',MovName],'Note');
    set(hObject,'foregroundcolor','black');
    return;
end

cd(MovPath)
xyloObj = VideoReader(MovName);

% while hasFrame(xyloObj)
%     vidFrame = readFrame(xyloObj);
%     image(vidFrame, 'Parent', handles.axes6);
%     
%     pause(1/xyloObj.FrameRate);
% end

Data.xyloObj = xyloObj;

global tot_star;
tot_star = 1;

axes(handles.axes4);
cla;
plot(fscope_signal_time(1:fscope_fps:round(tot_time*fscope_fps)),fscope_signal(1:fscope_fps:round(tot_time*fscope_fps)));
xlim([0 tot_time]);
ylim([y_min y_max]);
hold on;
plot([xyloObj.CurrentTime xyloObj.CurrentTime],[y_min y_max],'r');
global slider_value;
slider_value = xyloObj.CurrentTime/tot_time;
set(handles.slider2,'value',slider_value);
axes(handles.axes5);
axis on;
vidFrame = readFrame(xyloObj);
% axes(handles.axes6);
% imshow(vidFrame)
image(vidFrame, 'Parent', handles.axes6);

set(handles.text22,'str',num2str(round(xyloObj.CurrentTime)));
% set(handles.text24,'str',num2str(currframeindx));


set(hObject,'foregroundcolor','black');




function[] = timertickfcn1(obj,event,hObject, eventdata, handles)
% FIGM = getstoreddata(TH.fig);

global slider_value
global showwindow
global show_speed
global Data;

showwindow = get(handles.edit11,'string');
showwindow = str2num(showwindow);
if isempty(showwindow) || showwindow < 10
    showwindow = 10;
end
show_speed = get(handles.edit14,'string');
show_speed = str2num(show_speed);
if isempty(show_speed)
    show_speed = 2;
end
tot_time = Data.tot_time;
% pause(0.0001)
slider_value = get(handles.slider2,'value');
slider_time = tot_time*slider_value;
% show the movie in the axes6
if abs(Data.xyloObj.CurrentTime - slider_time) > 10
    Data.xyloObj.CurrentTime = slider_time;
end
vidFrame = readFrame(Data.xyloObj);
% image(vidFrame, 'Parent', handles.axes6);
axes(handles.axes6);
cla;
imshow(vidFrame);


% % show the signal in axes5
% fscope_signal = Data.fscope_signal;
% fscope_signal_time = Data.fscope_signal_time;
% 
% time_now = Data.xyloObj.CurrentTime;
% fscope_fps = Data.fscope_fps;
% 
% y_min = Data.y_min;
% y_max = Data.y_max;
% axes(handles.axes4);
% 
% cla;
% plot(fscope_signal_time(1:fscope_fps:floor(tot_time*fscope_fps)),fscope_signal(1:fscope_fps:floor(tot_time*fscope_fps)));
% hold on;
% plot([time_now time_now],[y_min y_max],'r');

% ylim([y_min y_max]);
% % % % axes(handles.axes5);
% % % % cla;
% % % % plot([time_now time_now],[y_min y_max],'r');
% % % % hold on;
% % % % if time_now-showwindow > 0
% % % %     plot(fscope_signal_time(round((time_now-showwindow)*fscope_fps):round((time_now+showwindow)*fscope_fps)),fscope_signal(round((time_now-showwindow)*fscope_fps):round((time_now+showwindow)*fscope_fps)));
% % % % else 
% % % %     plot_points = 2*showwindow*fscope_fps;
% % % %     time_plot = fscope_signal_time(round(time_now*fscope_fps):round(time_now*fscope_fps)+plot_points-1)-showwindow;
% % % %     signal_plot = fscope_signal(1:round(time_now+showwindow)*fscope_fps);
% % % %     signal_plot_tmp(1:plot_points-length(signal_plot),1) = signal_plot(1);
% % % %     signal_plot = [signal_plot_tmp;signal_plot];
% % % %     plot(time_plot,signal_plot);
% % % % %     plot(signal_plot);
% % % % end
% % % % ylim([y_min y_max]);
% % % % xlim([time_now-showwindow time_now+showwindow]);
% % % % % set(gca,'fontsize',10)
% % % % axis on;
% slider_value = time_now/tot_time;
% set(handles.slider2,'value',slider_value);
% set(handles.text22,'str',num2str(round(time_now)));
Data.xyloObj.CurrentTime = Data.xyloObj.CurrentTime + show_speed/Data.xyloObj.FrameRate;
guidata(hObject,handles);




function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
directoryname = get(hObject,'string');
% str = 'D:\analysis\MPOA opto';
search_path=path;
bool=all(ismember(directoryname,search_path));
if bool == 0
    errordlg('The Directory pathway isn''t exist, please enter or choose a DirPath','Â·¾¶´íÎó');
end
set(hObject,'fontsize',10);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dname = uigetdir('C:\Users\ycwei\Desktop\Videos to score\Transferred');
set(handles.edit10,'string',dname,'fontsize',10);
guidata(hObject,handles);


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)clc
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% % % global tot_star;
% % % global Data;
% % % global timermovhandle;



% % % if tot_star == 1
% % %     set(hObject,'string','Stop','foregroundcolor','red');
% % %     pause(0.001);
% % %     tot_star = 0;
% % %     time_to_execute = length(Data.time_accum);
% % %     timermovhandle = timer( ...
% % %         'ExecutionMode','fixedRate', ...
% % %         'TimerFcn', {@timertickfcn1,hObject,Data,handles}, ...
% % %         'BusyMode', 'queue', ...
% % %         'TasksToExecute', time_to_execute, ...
% % %         'Period', 0.001);
% % %     start(timermovhandle);
% % %         
% % % %     wait(timermovhandle);
% % % 
% % % else
% % %     stop(timermovhandle);
% % %     set(hObject,'string','Start','foregroundcolor','Black');
% % %     pause(0.001);
% % %     tot_star = 1;
% % %     
% % % %     wait(timermovhandle);
% % % end


global tot_star;
global Data;

if tot_star == 1
    set(hObject,'string','Stop','foregroundcolor','Red');
    tot_star = 0;
else tot_star = 1;
    set(hObject,'string','Start','foregroundcolor','Black');
end

fscope_signal = Data.fscope_signal;
fscope_signal_time = Data.fscope_signal_time;
fscope_fps = Data.fscope_fps;
y_min1 = Data.y_min;
y_max1 = Data.y_max;
tot_time = Data.tot_time;
Frame_rate = Data.xyloObj.FrameRate;

while hasFrame(Data.xyloObj)
    show_speed = get(handles.edit14,'string');
    show_speed = str2num(show_speed);
    if isempty(show_speed)
        show_speed = 2;
    end
    pause(0.0001);

    
    slider_value = get(handles.slider2,'value');
    slider_time = Data.tot_time*slider_value;
    if abs(Data.xyloObj.CurrentTime - slider_time) > 2
        Data.xyloObj.CurrentTime = slider_time;
    end
    vidFrame = readFrame(Data.xyloObj);
    Data.xyloObj.CurrentTime = Data.xyloObj.CurrentTime + (show_speed-1)/Data.xyloObj.FrameRate;
    image(vidFrame, 'Parent', handles.axes6);
    
    if tot_star == 1
        break;
    end
    
    
    showwindow = get(handles.edit11,'string');
    showwindow = str2num(showwindow);
    if isempty(showwindow) || showwindow < 10
        showwindow = 10;
    end



    
    time_now = Data.xyloObj.CurrentTime;
    axes(handles.axes4);
    cla;
    plot(fscope_signal_time(1:fscope_fps:floor(tot_time*fscope_fps)),fscope_signal(1:fscope_fps:floor(tot_time*fscope_fps)));
    hold on;
    plot([time_now time_now],[y_min1 y_max1],'r');
    
    
    axes(handles.axes5);
    cla;

    plot([time_now time_now],[y_min1 y_max1],'r');
    hold on;
    if time_now-showwindow > 0
        plot(fscope_signal_time(round((time_now-showwindow)*fscope_fps):round((time_now+showwindow)*fscope_fps)),fscope_signal(round((time_now-showwindow)*fscope_fps):round((time_now+showwindow)*fscope_fps)));
    else
        plot_points = 2*showwindow*fscope_fps;
        time_plot = fscope_signal_time(round(time_now*fscope_fps):round(time_now*fscope_fps)+plot_points-1)-showwindow;
        signal_plot = fscope_signal(1:round(time_now+showwindow)*fscope_fps);
        clear signal_plot_tmp;
        signal_plot_tmp(1:plot_points-length(signal_plot),1) = signal_plot(1);
        signal_plot = [signal_plot_tmp;signal_plot];
        plot(time_plot,signal_plot);
        %     plot(signal_plot);
    end
    ylim([y_min1 y_max1]);
    xlim([time_now-showwindow time_now+showwindow]);
    
    
   
    
    
    slider_value = Data.xyloObj.CurrentTime/Data.tot_time;
    set(handles.slider2,'value',slider_value);
    
    set(handles.text22,'str',num2str(round(Data.xyloObj.CurrentTime)));
end
        

    



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data;
set(hObject,'foregroundcolor','red');
start_time = get(handles.edit12,'string');
end_time = get(handles.edit13,'string');
start_time = str2num(start_time);
end_time = str2num(end_time);
FileName = get(handles.edit9,'string');
MovPath = get(handles.edit10,'string');
time_accum = Data.time_accum;
y_min = Data.y_min;
y_max = Data.y_max;
fscope_signal_time = Data.fscope_signal_time;
fscope_signal = Data.fscope_signal;
fscope_fps = Data.fscope_fps;
start_frame = find(time_accum > start_time,1);
end_frame = find(time_accum > end_time,1);
p_position = {[0.01 0.2 0.7 0.4];
    [[0.1 0.1 0.7 0.2]]};

showwindow = get(handles.edit11,'string');
showwindow = str2num(showwindow);
if isempty(showwindow) || showwindow < 10
    showwindow = 10;
end


show_speed = get(handles.edit14,'string');
show_speed = str2num(show_speed);
if isempty(show_speed)
    show_speed = 2;
end
MovName_new = [FileName(1:end-4),'_',num2str(start_time),'_',num2str(end_time)];

cd(MovPath)
video_abj = VideoWriter([MovName_new,'.avi']);
video_abj.FrameRate = Data.xyloObj.FrameRate;

open(video_abj)
Data.xyloObj.CurrentTime = start_time;
while hasFrame(Data.xyloObj) 
    time_now = Data.xyloObj.CurrentTime;
    if time_now > end_time
        break;
    end
    vidFrame = readFrame(Data.xyloObj);
    hh = figure('position',[300 100 752 700]);
    subplot('position',[0.0 0.3143 1  0.6857])
    imshow(vidFrame)
    subplot('position',[0.13 0.03 0.77 0.27])
    plot([time_now time_now],[y_min y_max],'r');
    hold on;
    plot(fscope_signal_time(round((time_now-showwindow)*fscope_fps):round((time_now+showwindow)*fscope_fps)),fscope_signal(round((time_now-showwindow)*fscope_fps):round((time_now+showwindow)*fscope_fps)));
    ylim([y_min y_max]);
    xlim([time_now-showwindow time_now+showwindow]);
    set(gca,'fontsize',10)
    axis on;
    set(gcf,'visible','off')
    vframe = getframe(hh);
    writeVideo(video_abj,vframe)
    Data.xyloObj.CurrentTime = Data.xyloObj.CurrentTime + (show_speed-1)/Data.xyloObj.FrameRate;
end
close(video_abj)
set(hObject,'foregroundcolor','black');


function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
