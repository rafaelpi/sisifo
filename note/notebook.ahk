;    2022-12-19 Notebook
;    Un mecanismo para abrir un editor de texto y crear una nota
;

#SingleInstance FORCE
SetWorkingDir, %A_ScriptDir%
FileEncoding, UTF-8
EnvGet user_profile_PATH, USERPROFILE
data_PATH := user_profile_PATH . "\Google Drive\pichavelasr\_notas\"

If !InStr(FileExist(data_PATH), "D")
{
	MsgBox, 1, S?sifo, No existe %data_PATH%.`n?Crearlo?
	IfMsgBox OK
		FileCreateDir, %data_PATH%
	IfMsgBox Cancel
		ExitApp
}

SetWorkingDir, %data_PATH%

#n::
filename := A_YYYY . A_MM . A_DD . "_" . A_Hour . A_Min . A_Sec . ".txt"
FileAppend,, %data_PATH%%filename%
Run, %data_PATH%%filename%, %data_PATH%
RETURN