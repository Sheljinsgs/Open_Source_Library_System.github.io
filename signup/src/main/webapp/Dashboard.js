console.log("Hello world");

function Check(){
        let input = document.querySelector('.searchbar').value.toLowerCase();
        let AccNo=document.querySelectorAll('.AccNo');
		let Title=document.querySelectorAll('.Title');
		let Author=document.querySelectorAll('.Author');
		let Publisher=document.querySelectorAll('.Publisher');
		let Status=document.querySelectorAll('.Status');
		let tot=AccNo.length;


		
	    for (let i = 0; i < tot; i++) {
            if(AccNo[i].innerHTML.toLowerCase().includes(input) || Title[i].innerHTML.toLowerCase().includes(input) || Author[i].innerHTML.toLowerCase().includes(input) || Publisher[i].innerHTML.toLowerCase().includes(input) || Status[i].innerHTML.toLowerCase().includes(input)){
				AccNo[i].parentNode.style.display=""
				Author[i].parentNode.style.display=""
				Publisher[i].parentNode.style.display=""
				Status[i].parentNode.style.display=""
				Title[i].parentNode.style.display=""	
			}
            else{
                AccNo[i].parentNode.style.display="none"
			}
	    }
	    console.log(book.length);
}