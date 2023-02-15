/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tstrassb <tstrassb@student.42>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/02 12:57:19 by tstrassb          #+#    #+#             */
/*   Updated: 2023/02/12 15:48:13 by tstrassb         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

/// @brief sends a signal to a server identified by its PID
/// (process ID).
/// @param 'pid' integer of process ID from server
/// @param 'i' used to send an 8-bit value
void	signal_sender(int pid, char i)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((i & (0x01 << bit)) != 0)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(100);
		bit++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;
	int	i;

	i = 0;
	if (argc == 3)
	{
		pid = ft_atoi(argv[1]);
		while (argv[2][i] != '\0')
		{
			signal_sender(pid, argv[2][i]);
			i++;
		}
		signal_sender(pid, '\n');
	}
	else
	{
		ft_printf("Error: format is wrong\n");
		ft_printf("Correct syntax: ./client <PID> <\"message\">\n");
	}
	return (0);
}
