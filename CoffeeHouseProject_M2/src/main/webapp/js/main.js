$(document).ready(function(){
	$('.nv1 div .main2,.sub1').mouseover(function(){ //Products �� ���콺 ����
        $('.sub1').css('display','block');//������ ��ǰ ���
    });
    
    $('.nv1 div .main2,.sub1').mouseout(function(){
        $('.sub1').css('display',''); //������ ��ǰ ��� �ȵǰ� ����
    });

	$('.p1,.subc').mouseover(function(){ //������ ��ǰ�� ���콺 ����
        $('.subc').css('display','block');//������ �׸��� ������ ����
    });
    
    $('.p1,.subc').mouseout(function(){//������ �׸��� �ȳ����� ����
        $('.subc').css('display','');
    });

	$('.p2,.subm').mouseover(function(){ //������ ��ǰ�� ���콺 ����
        $('.subm').css('display','block');//������ �׸��� ������ ����
    });
    
    $('.p2,.subm').mouseout(function(){//������ �׸��� �ȳ����� ����
        $('.subm').css('display','');
	});
	$('.p3,.suba').mouseover(function(){ //������ ��ǰ�� ���콺 ����
        $('.suba').css('display','block');//������ �׸��� ������ ����
    });
    
    $('.p3,.suba').mouseout(function(){//������ �׸��� �ȳ����� ����
        $('.suba').css('display','');
	});

	$('.nv1 div .main3,.sub2').mouseover(function(){ //Service �� ���콺 ����
        $('.sub2').css('display','block');//������ ��ǰ ���
    });
    
    $('.nv1 div .main3,.sub2').mouseout(function(){
        $('.sub2').css('display',''); //������ ��ǰ ��� �ȵǰ� ����
    });



	
    
});