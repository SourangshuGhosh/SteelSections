function varargout = Unsupported_Beam_design_closing_dialog(varargin)
% UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG MATLAB code for Unsupported_Beam_design_closing_dialog.fig
%      UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG, by itself, creates a new UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG or raises the existing
%      singleton*.
%
%      H = UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG returns the handle to a new UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG or the handle to
%      the existing singleton*.
%
%      UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG.M with the given input arguments.
%
%      UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG('Property','Value',...) creates a new UNSUPPORTED_BEAM_DESIGN_CLOSING_DIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Unsupported_Beam_design_closing_dialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Unsupported_Beam_design_closing_dialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Unsupported_Beam_design_closing_dialog

% Last Modified by GUIDE v2.5 04-Jun-2014 07:13:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Unsupported_Beam_design_closing_dialog_OpeningFcn, ...
                   'gui_OutputFcn',  @Unsupported_Beam_design_closing_dialog_OutputFcn, ...
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


% --- Executes just before Unsupported_Beam_design_closing_dialog is made visible.
function Unsupported_Beam_design_closing_dialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Unsupported_Beam_design_closing_dialog (see VARARGIN)

% Choose default command line output for Unsupported_Beam_design_closing_dialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Unsupported_Beam_design_closing_dialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Unsupported_Beam_design_closing_dialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Unsupported_Beam_design_closing_dialog,'Visible','off');
set(Opening_Dialog,'Visible','on');

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Unsupported_Beam_design_closing_dialog,'Visible','off');
Thank_You;
