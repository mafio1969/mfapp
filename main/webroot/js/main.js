var contentView = {
    lang: [],

    setLang: function (add, addComment, validComment) {
        this.lang = {
            add: add,
            addComment: addComment,
            validComment: validComment
        };
    },

    startLoad: function () {
        $('.mainLoading').css('display', 'block');
    },

    endLoad: function () {
        $('.mainLoading').css('display', 'none');
    },

    bindViewForm: function (element) {
        $(element).on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.valid()) {
                contentView.startLoad();
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        contentView.endLoad();
                        toastr.info(result.message);
                    }
                });
            }
        });
    },

    bindViewReportForm: function (element) {
        $(element).on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.valid()) {
                contentView.startLoad();
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        contentView.endLoad();
                        toastr.info(result.message);
                        setTimeout(function () {
                            window.location.href = window.location;
                        }, 1000);
                    }
                });
            }
        });
    },

    bindViewFormPermission: function () {
        $('#user-permissions-form').on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.valid()) {
                contentView.startLoad();
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        contentView.endLoad();
                        toastr.info(result.message);
                        setTimeout(function () {
                            window.location.href = window.location;
                        }, 1000);
                    }
                });
            }
        });
    },

    bindMarkNotification: function () {
        $('.goToLink').on("click", function (e) {
            let noteId = this.dataset.markId;
            $.ajax({
                url: '/notices/mark/' + noteId,
                type: "GET",
            });
        });
    },

    bindMarkModalNotification: function () {
        $('.modal-justification').on("click", function (e) {
            console.log($(this).parent().parent().find('.mark-button'));
            let parentElements = $(this).parent().parent();
            let markButton = parentElements.find('.mark-button');
            console.log(markButton.attr('href'));
            $.ajax({
                url: markButton.attr('href'),
                type: "GET",
                success: function (result) {
                    parentElements.removeClass('new-message');
                }
            });
        });
    },

    bindClick: function () {
        $('.link-comment').off('click').on("click", function (e) {
            e.preventDefault();
            var forms = $(this).parent().parent().find('div.add-comment');
            if (forms.length < 1) {
                var formId = contentView.generateForm();
                contentView.appendForm(formId, this);
                contentView.validateForm(formId);
                contentView.linkForm(formId);
            }
        });
    },

    generateForm: function () {
        return Math.floor(Math.random() * (100000 - 1 + 1) + 1);
    },

    appendForm: function (formId, element) {
        var formElement = '<div class="add-comment"><form id="'
            + formId + '" method="post" accept-charset="utf-8" class="form-comment" ' +
            'role="form" action="' + $(element).attr("href") + '" novalidate="novalidate">' +
            '<div class="form-group textarea required">' +
            '<label class="control-label" for="description">' + this.lang.addComment + '</label>' +
            '<textarea name="description" maxlength="255" id="description" ' +
            'class="form-control valid" rows="5" aria-invalid="false">' +
            '</textarea>' +
            '</div>' +
            '<button id="btn' + formId + '" type="submit" class="submit-form btn btn-default">' +
            '<span class=""></span>' + this.lang.add + '</button>' +
            '</div></form></div>';
        $(element).parent().after(formElement);
    },

    validateForm: function (formId) {
        $("#" + formId).validate({
            rules: {
                description: {
                    required: true
                }
            },
            messages: {
                description: {
                    required: this.lang.validComment
                }
            }
        });
    },

    linkForm: function (formId) {
        $("#" + formId).on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.valid()) {
                $('#btn' + formId).attr("disabled", true).find('span').addClass('loading');
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        let data = JSON.parse(result);
                        if (data.success) {
                            form[0].reset();
                            $(form).parent().parent().append(data.output);
                            $("#comments-summary").html('(' + parseInt(data.comments) + ')');
                            form.fadeOut("slow", function () {
                                $(form).parent().remove();
                            });
                            contentView.bindClick();
                            contentView.linkReport();
                            contentView.linkEditComment();

                            if (!form.parent().parent().hasClass('first-notes')) {
                                let noSubscription = form.parent().siblings('.comment-inner').children('.sub');
                                form.parent().siblings('.comment-inner').children('.subscription').addClass('subInActiveButton');
                                noSubscription.removeClass('subInActiveButton');
                            }
                        } else {
                            alert(data.message);
                            $('#btn' + formId).attr("disabled", false).find('span').removeClass('loading');
                        }
                    }
                });
            }
        });
    },

    linkEditComment: function () {
        $(".link-edit").off('click').on("click", function (e) {
            let link = $(this);
            e.preventDefault();
            $.ajax({
                url: link.data("item"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        $('#editComment').val(result.content);
                        $('#comment-edit-link').attr("href", link.attr("href"));
                        $('#editModalComment').modal('show');
                    } else {
                        window.location.href = window.location;
                    }
                }
            });
        });
    },

    submitEditComment: function () {
        $('#comment-edit-link').on("click", function (e) {
                e.preventDefault();
                if ($("#form-edit-comment").valid()) {
                    var button = $(this);
                    $(button).attr("disabled", true);
                    $(button).find('span').addClass('loading');
                    $.ajax({
                        url: button.attr("href"),
                        type: "POST",
                        data: {
                            description: $('#editComment').val()
                        },
                        success: function (result) {
                            if (result.success) {
                                window.location.href = window.location;
                            } else {
                                $(button).find('span').removeClass('loading');
                                $(button).attr("disabled", false);
                            }
                        }
                    });
                }
            }
        );
    },

    linkEditAnswer: function () {
        $(".link-edit-answer").off('click').on("click", function (e) {
            let link = $(this);
            e.preventDefault();
            $.ajax({
                url: link.data("item"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        CKEDITOR.instances['editCommentAnswer'].setData(result.content);
                        $('#answer-edit-link').attr("href", link.attr("href"));
                        $('#editModalAnswer').modal('show');
                    } else {
                        window.location.href = window.location;
                    }
                }
            });
        });
    },

    submitEditAnswer: function () {
        $('#answer-edit-link').on("click", function (e) {
                e.preventDefault();
                if ($("#form-edit-answer").valid()) {
                    var button = $(this);
                    $(button).attr("disabled", true);
                    $(button).find('span').addClass('loading');
                    $.ajax({
                        url: button.attr("href"),
                        type: "POST",
                        data: {
                            description: $('#editCommentAnswer').val()
                        },
                        success: function (result) {
                            if (result.success) {
                                window.location.href = window.location;
                            } else {
                                $(button).find('span').removeClass('loading');
                                $(button).attr("disabled", false);
                            }
                        }
                    });
                }
            }
        );
    },

    bindModalForm: function (form, button) {
        $(form).on("submit", function (e) {
            e.preventDefault();
            if ($(this).valid()) {
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        let data = JSON.parse(result);
                        if (data.success) {
                            window.location.href = window.location;
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    bindModalFormCK: function (form, button) {
        $(form).on("submit", function (e) {
            e.preventDefault();
            if ($(this).valid()) {
                // CKEDITOR.instances.description.updateElement();
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        let data = JSON.parse(result);
                        if (data.success) {
                            window.location.href = window.location;
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    moreComments: function () {
        $("#more-comments").on("click", function (e) {
            e.preventDefault();
            $.ajax({
                url: $(this).attr("href"),
                type: "GET",
                success: function (result) {
                    let data = JSON.parse(result);
                    if (data.success) {
                        $("#notes-comments").append(data.output);
                        if (data.pageUrl !== '') {
                            $("#more-comments").attr("href", data.pageUrl);
                        } else {
                            $("#more-comments").remove();
                        }
                        contentView.bindClick();
                        contentView.linkReport();
                        contentView.linkRemove();
                        contentView.bindVoteUp();
                    }
                }
            });
        });
    },

    linkReport: function () {
        $(".link-report").off('click').on("click", function (e) {
            e.preventDefault();
            $('#reportModal').modal('show');
            $('#modal-content').empty().append($(this).parent().parent().find('div.user-comment')[0].innerText);
            $('#report-link').attr('href', $(this).attr('href'));
        });
    },

    linkReportQuestion: function () {
        $(".link-report-question").off('click').on("click", function (e) {
            e.preventDefault();
            $('#reportModal').modal('show');
            $('#modal-content').empty().append($(this).parent().parent().find('div.user-comment')[0].innerText);
            $('#report-link').attr('href', $(this).attr('href'));
        });
    },

    linkReportContent: function () {
        $(".link-report-content").off('click').on("click", function (e) {
            e.preventDefault();
            $('#reportModal').modal('show');
            $('#report-link').attr('href', $(this).attr('href'));
        });
    },

    linkRemove: function () {
        $('.link-remove').on("click", function (e) {
            e.preventDefault();
            $('#removeModal').modal('show');
            $('#remove-link').attr('href', $(this).attr('href'));
        });
    },

    removeModal: function (message) {
        $('#form-remove').validate({
            rules: {
                content: "required"
            },
            messages: {
                content: message
            }
        });
        $('#remove-link').on("click", function (e) {
            e.preventDefault();
            if ($("#form-remove").valid()) {
                var button = $(this);
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                $.ajax({
                    url: button.attr("href"),
                    type: "POST",
                    data: {
                        content: $('#removeReason').val()
                    },
                    success: function (result) {
                        if (result.success) {
                            window.location.href = window.location;
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    reportModal: function () {
        $('#report-link').on("click", function (e) {
            e.preventDefault();
            if ($("#form-report").valid()) {
                var button = $(this);
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                $.ajax({
                    url: $(this).attr("href"),
                    type: "POST",
                    data: {
                        type: $('#addReportType').val(),
                        content_input: $('#addReportInput').val(),
                        content_text: $('#addReportText').val()
                    },
                    success: function (result) {
                        if (result.success) {
                            window.location.href = window.location;
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    bindVote: function () {
        $('.vote').on("click", function (e) {
            e.preventDefault();
            var element = $(this);
            $.ajax({
                url: $(this).attr("href"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        $('#v-agree, #vd-agree').empty().html(result.agree);
                        if (element.hasClass('voted')) {
                            element.removeClass('voted');
                        } else {
                            element.addClass('voted');
                            var elementInActivSub = element.parent().siblings('.sub.subInActiveButton');
                            var elementActivSub = element.parent().siblings('.subscription');
                            if (elementInActivSub.length) {
                                elementActivSub.addClass('subInActiveButton');
                                elementInActivSub.removeClass('subInActiveButton');
                            }
                        }
                    }
                }
            });
        });
    },

    bindVoteUp: function () {
        $('.vote-up-comment').off('click').on("click", function (e) {
            e.preventDefault();
            var counter = '#' + $(this).attr("id") + '-comment';
            var element = $(this);
            $.ajax({
                url: $(this).attr("href"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        $(counter).empty().html(result.votes);
                        if (element.hasClass('voted')) {
                            element.removeClass('voted');
                        } else {
                            element.addClass('voted');
                            var elementInActivSub = element.parent().siblings('.sub.subInActiveButton');
                            var elementActivSub = element.parent().siblings('.subscription');
                            if (elementInActivSub.length) {
                                elementActivSub.addClass('subInActiveButton');
                                elementInActivSub.removeClass('subInActiveButton');
                            }
                        }
                    }
                }
            });
        });
    },

    bindSubscription: function () {
        $('.subscription').on("click", function (e) {
            e.preventDefault();
            var element = $(this);
            var userFallowers = $('.user-fallowers').find('.count');
            $.ajax({
                url: $(this).attr("href"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        element.siblings('.subscription').removeClass('subInActiveButton');
                        element.addClass('subInActiveButton');

                        if ($("a[title='add subscription']").hasClass('subInActiveButton')) {
                            if (userFallowers) {
                                let count = userFallowers.text();
                                userFallowers.text(parseInt(count) + 1);
                            }
                        } else {
                            if (userFallowers) {
                                let count = userFallowers.text();
                                userFallowers.text(parseInt(count) - 1);
                            }
                        }
                    } else {
                        alert(result.message);
                    }
                },
                error: function (error) {
                    alert('An unexpected error has occurred');
                }
            });
        });
    },

    bindSubscriptionNote: function () {
        $('.subscription-note').on("click", function (e) {
            e.preventDefault();
            var element = $(this);
            $.ajax({
                url: $(this).attr("href"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        element.siblings('.subscription').removeClass('subInActiveButton');
                        element.addClass('subInActiveButton');
                    } else {
                        alert(result.message);
                    }
                },
                error: function (error) {
                    alert('An unexpected error has occurred');
                }
            });
        });
    },

    bindSubscriptionAndDeleteParent: function () {
        $('.subscription').on("click", function (e) {
            e.preventDefault();
            var element = $(this);
            let parent = element.parent().parent();
            let articleElement = element.parent().parent().parent();
            $.ajax({
                url: $(this).attr("href"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        if (articleElement.children().length === 2) {
                            articleElement.addClass('removeAll');
                        }
                        parent.remove();
                    } else {
                        alert(result.message);
                    }
                },
                error: function (error) {
                    alert('An unexpected error has occurred');
                }
            });
        });
    },

    bindFormComment: function () {
        $('.form-comment').on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            $.ajax({
                url: form.attr("action"),
                type: "POST",
                data: form.serialize(),
                success: function (result) {
                    window.location.reload();
                }
            });
        });
    },

    bindCommentLink: function () {
        $('#comment-link').on("click", function (e) {
            e.preventDefault();
            if ($("#form-sub-comment").valid()) {
                var button = $(this);
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                $.ajax({
                    url: $(this).attr("href"),
                    type: "POST",
                    data: {
                        description: $('#addComment').val()
                    },
                    success: function (result) {
                        let data = JSON.parse(result);
                        if (data.success) {
                            window.location.href = window.location;
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    bindLinkCommentQuestion: function () {
        $(".link-comment").off('click').on("click", function (e) {
            e.preventDefault();
            $('#commentModal').modal('show');
            $('#modal-content-comment').empty().append($(this).parent().find('div.user-comment')[0].innerText);
            $('#comment-link').attr('href', $(this).attr('href'));
        });
        $(".link-comment-question").off('click').on("click", function (e) {
            e.preventDefault();
            $('#commentModal').modal('show');
            $('#modal-content-comment').empty().append($(this).parent().parent().find('div.user-comment')[0].innerHTML);
            $('#comment-link').attr('href', $(this).attr('href'));
        });
    },

    bindImagePreview: function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#image-content').css('background-image', 'url(' + e.target.result + ')');
        };

        function readURL(input) {
            if (input.files && input.files[0]) {
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#photo").change(function () {
            readURL(this);
        });
    },

    bindSelect: function (message) {
        $('.js-example-basic-single').select2({
            tags: true,
            maximumSelectionLength: 3,
            selectOnClose: true,
            language: {
                maximumSelected: function () {
                    return message;
                }
            }
        });
    },

    bindReportModal: function () {
        $("#form-report").validate({});
        $('#addReportType').on('change', function () {
            if (parseInt($(this).val()) === 3) {
                $("#addReportText").rules("add", {
                    required: true,
                    minlength: 3,
                    messages: {
                        required: "<?= __('Reason cannot be empty.') ?>",
                        minlength: "<?= __('Reason must have min. 20 characters.') ?>"
                    }
                });
                $("#reportTextContainer").show();
                $("#addReportInput").rules("remove");
                $("#reportInputContainer").hide();
            } else if (parseInt($(this).val()) === 2) {
                $("#addReportInput").rules("add", {
                    required: true,
                    messages: {
                        required: "<?= __('Field cannot be empty.') ?>",
                    }
                });
                $("#reportInputContainer").show();
                $("#addReportText").rules("remove");
                $("#reportTextContainer").hide();
            } else {
                $('#reportInputContainer').hide();
                $('#reportTextContainer').hide();
            }
        }).trigger('change');
    },

    bindReportRemove: function (message, redirect) {
        $('#form-report-delete').validate({
            rules: {
                description: "required"
            },
            messages: {
                description: message
            }
        });
        $('#form-report-delete').on("submit", function (e) {
            e.preventDefault();
            var button = $('#submit-delete');
            if ($(this).valid()) {
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        if (result.success) {
                            window.location.href = redirect;
                            // $(button).find('span').removeClass('loading');
                            // toastr.info(result.message);
                            // $('.btn-report-action').attr("disabled", true);
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    bindReportReject: function (message) {
        $('#form-report-reject').validate({
            rules: {
                description: "required"
            },
            messages: {
                description: message
            }
        });
        $('#form-report-reject').on("submit", function (e) {
            e.preventDefault();
            var button = $('#submit-reject');
            if ($(this).valid()) {
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        if (result.success) {
                            $(button).find('span').removeClass('loading');
                            toastr.info(result.message);
                            $('.btn-report-action').attr("disabled", true);
                            setTimeout(function () {
                                window.location.href = '/reports/waiting';
                            }, 1000);
                        } else {
                            $(button).find('span').removeClass('loading');
                            $(button).attr("disabled", false);
                            $(button).text("Error");
                        }
                    }
                });
            }
        });
    },

    bindReportContact: function (message) {
        $('#form-report-contact').validate({
            rules: {
                description: "required"
            },
            messages: {
                description: message
            }
        });
        $('#form-report-contact').on("submit", function (e) {
            e.preventDefault();
            var button = $('#submit-contact');
            if ($(this).valid()) {
                $(button).attr("disabled", true);
                $(button).find('span').addClass('loading');
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        if (result.success) {
                            $(button).find('span').removeClass('loading');
                            toastr.info(result.message);
                            $('#buttonReportContact').attr("disabled", true);
                            setTimeout(function () {
                                window.location.href = '/reports/waiting';
                            }, 1000);
                        } else {
                            $(button).find('span').removeClass('loading');
                            toastr.error(result.message);
                            $(button).attr("disabled", false);
                        }
                    }
                });
            }
        });
    },

    bindReportAccept: function () {
        $('#reason-accept').on("click", function (e) {
            e.preventDefault();
            var button = $(this);
            button.attr("disabled", true);
            button.find('span').addClass('loading');
            $.ajax({
                url: button.data("href"),
                type: "GET",
                success: function (result) {
                    if (result.success) {
                        $(button).find('span').removeClass('loading');
                        toastr.info(result.message);
                        $('.btn-report-action').attr("disabled", true);
                    } else {
                        button.find('span').removeClass('loading');
                        button.attr("disabled", false);
                    }
                }
            });
        });
    }
};
