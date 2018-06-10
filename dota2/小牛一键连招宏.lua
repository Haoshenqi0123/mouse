--readme
--dota2英雄转身很慢,因此使用脚本的时候请确保您的鼠标指针不距离目标英雄太远
--------------------------------------------------------------------------
----------------        Basic Setting       ------------------------------
--------------------------------------------------------------------------
local refresh = 5
local normal = 4
local set_off_key = 6
local key_A = 0x1e
local key_S = 0x1f
local key_Q = 0x10
local key_W = 0x11
local key_E = 0x12
local key_R = 0x13
local key_D = 0x20 --刷新球快捷键
local key_F = 0x21 --跳刀快捷键
local key_Space = 0x39 --秘法鞋快捷键
local key_F1 = 0x3b
local Attack_time = 460 
local Magic_time = 690
local Item_time = 1
--施法前摇/后摇0.69/0.5 
--攻击前摇/后摇0.46/0.86
--------------------------------------------------------------------------
----------------          Function          ------------------------------
--------------------------------------------------------------------------
function Act(key,time)
    PressAndReleaseKey(key)
    wait(10)
    PressMouseButton(1)
    wait(10)
    ReleaseMouseButton(1)
    wait(time)
    wait(150)
    PressAndReleaseKey(key_S)
    PressAndReleaseKey(key_F1)
end
function wait(time)
    --这个循环没有卵用,但是不这么写,sleep不会自己醒#.#
    for i = 0, 0 do 
    Sleep(time)
    end
end

function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then    
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == normal) 
     then
        --没有刷新球的时候
        --其实没必要用分号
        Act(key_F,100);
        Act(key_R,Item_time);
        Act(key_F1,Item_time);
        Act(key_A,Attack_time);
        Act(key_W,Magic_time);
        Act(key_A,Attack_time);
        Act(key_Q,Magic_time+200);
        Act(key_A,Attack_time);
        Act(key_Space,Item_time);    
    else if (event == "MOUSE_BUTTON_PRESSED" and arg == refresh) then
        --有刷新球的时候
        Act(key_F,100);
        Act(key_R,Item_time);
        Act(key_F1,Item_time);
        Act(key_A,Attack_time);     
        Act(key_W,Magic_time);
        Act(key_A,Attack_time);
        Act(key_Q,Magic_time+200);
        Act(key_A,Attack_time);
        Act(key_Space,Item_time);
        Act(key_D,Item_time);
        wait(200)
        Act(key_Space,Item_time);
        Act(key_R,Item_time);
        Act(key_F1,Item_time);
        Act(key_A,Attack_time);
        Act(key_W,Magic_time);
        Act(key_A,Attack_time);
        Act(key_Q,Magic_time+200);
        end
    end
 end
