/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tstrassb <tstrassb@student.42>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/02 13:26:00 by tstrassb          #+#    #+#             */
/*   Updated: 2023/02/12 12:13:57 by tstrassb         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

/// @brief  handles a signal from SIGUSR1, if signal is received
/// function uses bit manipulation to set value of 'i'.
/// @param 'signal' integer that represents the signal received
/// @param '|=' operator used to set value of the 'bit'-th bit of 'i' to 1
void	signal_handler(int signal)
{
	static int	bit;
	static int	i;

	if (signal == SIGUSR1)
		i |= (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		ft_printf("%c", i);
		bit = 0;
		i = 0;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	(void)argv;
	if (argc != 1)
	{
		ft_printf("Error: format is wrong\n");
		ft_printf("Correct syntax: ./server\n");
		return (0);
	}
	pid = getpid();
	ft_printf("PID %d\n", pid);
	ft_printf("Awaiting message from client...\n");
	while (argc == 1)
	{
		signal(SIGUSR1, signal_handler);
		signal(SIGUSR2, signal_handler);
		pause ();
	}
	return (0);
}
