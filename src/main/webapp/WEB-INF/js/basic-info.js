/**
 * 
 */
$(function (){
	var height=$(".page-content").outerHeight();
	$(".nav-left").css("height",height);
	$.ms_DatePicker({
        YearSelector: ".sel_year",
        MonthSelector: ".sel_month",
        DaySelector: ".sel_day"
	});
	$.ms_DatePicker();
	initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
	$(".page-content").bind('resize',function(){
		var height=$(".page-content").outerHeight();
		$(".nav-left").css("height",height);
	});
	var provinceValue=$("#province").val();
	var cityValue=$("#city").val();
	var area=$("#area").val();
	var province=area_array[provinceValue];
	var city=sub_array[provinceValue][cityValue];
	var str1="<option value='" + provinceValue + "' selected='selected'>" + province + "</option>";
	var str2="<option value='" + cityValue + "' selected='selected'>" + city + "</option>";
	var str3="<option value='" + area + "' selected='selected'>" + area + "</option>";
	if(provinceValue!=0)
	{
		$("#seachprov").append(str1);
	}
	if(cityValue!=0)
	{
		$("#seachcity").append(str2);
	}
	if(area!=0)
	{
		$("#seachdistrict").append(str3);
	}
});
