var Validate = {
    
    /**验证用户名
    姓名校验规则：
    1.汉字、字母、中间点“•”、下方点“.”，其他字符禁止录入。
    2.仅输入汉字以及下方点“.”时，提示：姓名格式错误
    3.仅输入字母以及中间点“•”时，提示：姓名格式错误
    **/
    name:function(username){
        var par1 = /^[A-Za-z\u4e00-\u9fa5]+[\.·]?[A-Za-z\u4e00-\u9fa5]+$/,//能匹配少数民族，外国人名字
            par2 = /^[A-Za-z\u4e00-\u9fa5]+[\.·]$/;//错误姓名格式
        if(!username) 
            return '姓名不能为空';
        if(par2.test(username) == true){
            return '姓名格式错误';
        }else if(username.length<2 || username.length>20 || par1.test(username)==false){
            //alert('请输入2-20位汉字或字母');
            return '请输入2-20位汉字或字母';
        }else
            return true;
    },
    
    /**验证日期
    日期校验规则：
    年：1900-2015，
    月：1-12或01-12，
    日：1-31或01-31
    **/
    date:function(date){
        if (typeof date != 'array') {
            date = date.split('-');
        }
        var year = date[0],
            y_par = /(19\d\d)|(20[01][0-5])/;

        var month = date[1],
            m_par = /(^[1-9]$|^1[0-2]$)|(^0[1-9]$|^1[0-2]$)/;

        var day = date[2],
            d_par = /(^[1-9]$|^[1-2][0-9]$|^3[0-1]$)|(^0[1-9]$|^[1-2][0-9]$|^3[0-1]$)/;
        var err = ['年份','月份','日期'];
        for (var i = 0; i < date.length; i++) {
            if (date[i] == ''){
                return err[i]+'不能为空';
            }
        }
        if (d_par.test(day) === false ||
            m_par.test(month) === false ||
            y_par.test(year) === false){
            //alert('日期输入有误，请重新输入');
            return '日期输入有误，请重新输入';
        }else {
            return true;
        }
    },
    /**验证手机号
    手机号格式校验：
    1、以130、131、132、133、。。。。。为前缀（已有库手机号前缀）
    2、11位数字
    **/
    phone:function(phone){
        if (!phone) {return '手机号不能为空'};
        var par = /^((13[0-9])|147|(17[6-8])|(15[0-9])|(18[0-9]))[0-9]{8}$/;
        if(par.test(phone)===false){
            //alert('输入的手机号格式有误，请重新输入');
            return '输入的手机号格式有误，请重新输入';
        }else
            return true;
    },
    
    /**验证微信号
    微信号校验规则：
    可以使用6—20个字母、数字、下划线和减号，
    必须以字母开头（不区分大小写）
    **/
    wechat:function(wechat){
        if (!wechat) {return '微信号不能为空'};
        //var par = /^[a-zA-Z][a-zA-Z0-9_\-]{5,19}/;
        var par = /^[-_a-zA-Z0-9]+$/;
        if (wechat.length < 6 || 
            wechat.length > 20 ||
            par.test(wechat)===false){
            //alert('微信号格式有误，请重新输入');
            return '微信号格式有误，请重新输入';
        }else
            return true;
    },
    
    /**城市
    城市校验规则：可以使用2—20个汉字，或字母组合
    错误提示：输入的城市有误，请重新输入
    **/
    city:function(city){
        if (!city) {return '城市不能为空'};
        var par = /^[A-Za-z\u4e00-\u9fa5]{2,20}$/;
        if(par.test(city)===false){
            //alert('输入的城市有误，请重新输入');
            return '输入的城市有误，请重新输入';
        }else
            return true;
    },
    
    /**email
    邮箱校验规则：分成“第一部分@第二部分”这样
    第一部分：由字母、数字、下划线、短线“-”、点号“.”组成，
    第二部分：为一个域名，域名由字母、数字、短线“-”、域名后缀组成
    **/
    email:function(email){
        if (!email) {return '邮箱不能为空'};
        var par = /^[a-zA-Z0-9_\-\.]{1,}@[a-zA-Z0-9\-]+(\.[a-zA-Z]{2,5})+$/;//兼容.buct.edu.cn格式的邮箱
        if(par.test(email)===false){
            //tip.html('邮箱格式有误，请重新输入');
            return '邮箱格式有误，请重新输入';
        }else
            return true;
    },
    /**昵称
    昵称校验规则：
    同微信昵称规则，或非程序非法字符即可。暂不做字数限制
    **/
    nickname:function(nickname){
        if (nickname.length > 33) {
            //tip.html('最多可输入33个字符');
            return '最多可输入33个字符';
        };
        //var par = /^[a-zA-Z0-9\u4e00-\u9fa5]{1,33}/i;
        //var par = ;
        if(!/[\/\\"<>]/gi.test(nickname)===false){
            //tip.html('输入内容中不能含有字符<>/');
            return '输入内容中不能含有字符<>/';
        }else
            return true;
    }
}
//window['Validate'] = Validate;