function CheckHistory(){
        let input = document.querySelector('.searchbar').value.toLowerCase();
        let Date1=document.querySelectorAll('.Date');
		let RollNo=document.querySelectorAll('.RollNo');
		let AccNo=document.querySelectorAll('.AccNo');
		let Status=document.querySelectorAll('.Status');
		let Title=document.querySelectorAll('.Title');
		let Author=document.querySelectorAll('.Author');
		let Publisher=document.querySelectorAll('.Publisher');
		let Edition=document.querySelectorAll('.Edition');

		let tot=AccNo.length;


		
	    for (let i = 0; i < tot; i++) {
            if(Date1[i].innerHTML.toLowerCase().includes(input) || RollNo[i].innerHTML.toLowerCase().includes(input) || AccNo[i].innerHTML.toLowerCase().includes(input) || Status[i].innerHTML.toLowerCase().includes(input) || Title[i].innerHTML.toLowerCase().includes(input) || Author[i].innerHTML.toLowerCase().includes(input) || Publisher[i].innerHTML.toLowerCase().includes(input) || Edition[i].innerHTML.toLowerCase().includes(input)){
				Date1[i].parentNode.style.display=""
				RollNo[i].parentNode.style.display=""
				AccNo[i].parentNode.style.display=""
				Status[i].parentNode.style.display=""
				Title[i].parentNode.style.display=""
				Author[i].parentNode.style.display=""
				Publisher[i].parentNode.style.display=""
				Edition[i].parentNode.style.display=""	
			}
            else{
                AccNo[i].parentNode.style.display="none"
			}
	    }
}