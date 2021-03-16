export default function subscriptionValidation() {
    const subscriptionForm = $("#subscription-form")

    subscriptionForm.validate({
        onsubmit: true,
        rules: {
            rodo: {
                required: false,
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            email: {
                required: subscriptionForm.find('input[name="email"]').data('error'),
                email: subscriptionForm.find('input[name="email"]').data('error')
            }
        }
    })


    subscriptionForm.submit((event) => {
        const rodo = subscriptionForm.find('input[name="rodo"][value=1]')

        if(rodo.hasClass( "checked" )) {
            subscriptionForm.submit()

        } else {
            event.preventDefault()
            const error = rodo.data('error')
            subscriptionForm.find('.rodo-error').text(error)
        }
    })
}