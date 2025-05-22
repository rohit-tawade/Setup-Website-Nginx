document.addEventListener('DOMContentLoaded', function() {
    // Update copyright year
    document.getElementById('year').textContent = new Date().getFullYear();

    // Smooth scrolling for navigation links
    document.querySelectorAll('nav a').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            window.scrollTo({
                top: targetElement.offsetTop - 100,
                behavior: 'smooth'
            });
            
            // Update URL without page reload
            history.pushState(null, null, targetId);
        });
    });

    // Form submission handling
    // const contactForm = document.getElementById('contactForm');
    // if (contactForm) {
    //     contactForm.addEventListener('submit', function(e) {
    //         e.preventDefault();
            
    //         // Get form values
    //         const name = document.getElementById('name').value;
    //         const email = document.getElementById('email').value;
    //         const message = document.getElementById('message').value;
            
    //         // Here you would typically send the data to a server
    //         console.log('Form submitted:', { name, email, message });
            
    //         // Show success message
    //         alert('Thank you for your message, Rohit will get back to you soon!');
            
    //         // Reset form
    //         contactForm.reset();
    //     });
    // }

    // Initialize resume preview
    initializeResumePreview();
});

function initializeResumePreview() {
    const resumeIframe = document.querySelector('.resume-iframe');
    if (resumeIframe) {
        // Check if PDF is loaded properly
        resumeIframe.onload = function() {
            console.log('Resume PDF loaded successfully');
        };
        
        resumeIframe.onerror = function() {
            console.error('Error loading resume PDF');
            // Fallback content
            resumeIframe.innerHTML = '<p>Unable to load PDF preview. Please download the resume instead.</p>';
        };
    }
}