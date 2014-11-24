$(document).ready(function() {
    $('#myForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            aaistaffname: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            psstaffname: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            surveyorname: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            fathername: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            rto: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            incharge: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            stationid: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The name must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            gender: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required'
                    }
                }
            },
            dob: {
                validators: {
                    notEmpty: {
                        message: 'The date of birth is required'
                    },
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'The date of birth is not valid'
                    }
                }
            },
            date: {
                validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'The date is not valid'
                    }
                }
            },
            time: {
                validators: {
                    notEmpty: {
                        message: 'The time is required'
                    },
                    regexp: {
                        regexp: /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/,
                        message: 'The time is not valid'
                    }
                }
            },
            address: {
            	message: 'The address is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    }
                }
            },
            location: {
            	message: 'The location is not valid',
                validators: {
                    notEmpty: {
                        message: 'The location is required and cannot be empty'
                    }
                }
            },
            areaname: {
            	message: 'The location is not valid',
                validators: {
                    notEmpty: {
                        message: 'The location is required and cannot be empty'
                    }
                }
            },
            venue: {
            	message: 'The venue is not valid',
                validators: {
                    notEmpty: {
                        message: 'The venue is required and cannot be empty'
                    }
                }
            },
            licenseno: {
            	message: 'The license number is not valid',
                validators: {
                    notEmpty: {
                        message: 'The license number is required and cannot be empty'
                    }
                }
            },
            passportno: {
            	message: 'The passport number is not valid',
                validators: {
                    notEmpty: {
                        message: 'The passport number is required and cannot be empty'
                    }
                }
            },
            issuingauthority: {
            	message: 'The issuing authority is not valid',
                validators: {
                    notEmpty: {
                        message: 'The issuing authority is required and cannot be empty'
                    }
                }
            },
            pincode: {
            	message: 'The pincode is not valid',
                validators: {
                    notEmpty: {
                        message: 'The pincode is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[0-9]{6}$/,
                        message: 'The pincode must be a 6-digit number'
                    }
                }
            },
            contactno: {
            	message: 'The contact number is not valid',
                validators: {
                    notEmpty: {
                        message: 'The contact number is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[0-9]{10}$/,
                        message: 'The contact number must be a 10-digit number'
                    }
                }
            },
            occupation: {
            	message: 'The occupation is not valid',
                validators: {
                    notEmpty: {
                        message: 'The occupation is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            photo: {
            	message: 'The photo is not valid',
                validators: {
                    notEmpty: {
                        message: 'The photo is required and cannot be empty'
                    },
                    file: {
                        extension: 'jpeg,png,jpg',
                        type: 'image/jpeg,image/png',
                        maxSize: 2097152,   // 2048 * 1024
                        message: 'The selected file is not valid (Only jpg/jpeg/png formats supported)'
                    }
                }
            },
            pwd: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 14,
                        message: 'The password must be more than 6 and less than 14 characters long'
                    }
                }
            },
            newpwd1: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    identical: {
                        field: 'newpwd2',
                        message: 'The password and its confirm are not the same'
                    },
                    stringLength: {
                        min: 6,
                        max: 14,
                        message: 'The password must be more than 6 and less than 14 characters long'
                    }
                }
            },
            newpwd2: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    identical: {
                        field: 'newpwd1',
                        message: 'The password and its confirm are not the same'
                    },
                    stringLength: {
                        min: 6,
                        max: 14,
                        message: 'The password must be more than 6 and less than 14 characters long'
                    }
                }
            }
        }
    });
});